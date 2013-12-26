require 'food_apis_module'

class FoodItem
  include Mongoid::Document
  include FoodApisModule #include all functions from foodAPIs Module

  field :name, type: String
  field :nutritions, type: Object

  def self.new_item item
    id = "#{item[:api_key]} #{item[:item_id]}"
    name = item[:name]
    nutritions = item[:nutritions]

    if FoodItem.where(_id: id).exists?
      "element exists"
    else
      i = FoodItem.new(_id: id, name: name, nutritions: nutritions)
      i.save
    end
  end

  def self.get_all_items
    FoodItem.all.count
  end
end
