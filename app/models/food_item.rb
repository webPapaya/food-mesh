class FoodItem
  include Mongoid::Document

  field :name, type: String
  field :nutritions, type: Object
  field :search, type: Array

  def self.new_item
    "test"
  end
end
