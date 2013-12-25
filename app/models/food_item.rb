require 'food_apis_module'

class FoodItem
  include Mongoid::Document
  include FoodApisModule #include all functions from foodAPIs Module

  field :name, type: String
  field :nutritions, type: Object
  field :search, type: Array

  def self.new_item item
    name = item[:name]
    nutritions = item[:nutritions]
    i = FoodItem.new(name: name, nutritions: nutritions, search: [])
    i.save
    i
  end
end
