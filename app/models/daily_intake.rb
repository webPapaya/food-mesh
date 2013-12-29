class DailyIntake
  include Mongoid::Document
  field :key, type: String
  field :value, type: Float
  field :unit, type: String
  field :category, type: String

  validates_presence_of :key, :value, :unit, :category
  validates_uniqueness_of :key

  validates_inclusion_of :category, :in => %w( general vitamin mineral )
  validates_inclusion_of :unit, :in => %w( g mg kcal l )
end
