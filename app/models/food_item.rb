##
# university:  University of Applied Sciences Salzburg
# studie:      MultiMediaTechnology
# usage:	     Multimediaprojekt 2a (MMP2a)
# @author:     - Thomas Mayrhofer (thomas@mayrhofer.at)

require 'food_apis_module'

class FoodItem
  include Mongoid::Document

  field :name, type: String
  field :nutritions, type: Object

  def self.new_item item
    id = "#{item[:api_key]}-#{item[:item_id]}"
    if FoodItem.where(_id: id).exists?
      "element exists"
    else
      safe_item_to_db item
    end
  end

  ##
  # searches local database for an item with given id
  # @return item or nil
  def self.get_local_item (item_id)
    FoodItem.find(item_id)
  end

  def self.get_all_items
    FoodItem.all
  end

  def self.search_query (query)
    items = Search.search query

    if items.nil?
      items = search_apis query
      safe_item_to_db items
      Search.add query, items
    else
      items = get_local_items items
    end

    items
  end






  ##
  # safes a given items to the database
  # checks if the item is already in the database
  # returns true if it was saved
  def self.safe_item_to_db(items)
    #@todo very dirty hack should be replaced
    if items.class == Hash
      items = [items]
    end

    items.each do |item|
      id = create_id item[:api_key], item[:item_id]
      item_db = FoodItem.find(id)

      if item_db.nil?
        name = item[:name]
        nutritions = item[:nutritions]
        i = FoodItem.new(_id: id, name: name, nutritions: nutritions)
        i.save
      end
    end
  end

  private
  def self.create_id (api_key, item_id)
    "#{api_key}-#{item_id}"
  end
end
