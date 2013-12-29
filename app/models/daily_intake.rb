class DailyIntake
  include Mongoid::Document
  field :key, type: String
  field :value, type: Number
  field :unit, type: String
end
