class Search
  include Mongoid::Document
  field :_id, type: String
  field :food_items, type: Array

  validates_presence_of :id, :food_items

  def self.search _query
    Search.find(_query)
  end

  def self.add (_query, _item_list)
    i = Search.new(
        _id: _query,
        food_items: prepare_item_list(_item_list)
    )
    i.save
  end

  private
  def self.prepare_item_list(_item_list)
    list = []
    _item_list.each do |item|
      ap item
      list << (FoodItem.create_id item[:api_key], item[:item_id])
    end
    list
  end
end
