json.array!(@daily_intakes) do |daily_intake|
  json.extract! daily_intake, :id, :key, :value, :unit, :category
  json.url daily_intake_url(daily_intake, format: :json)
end
