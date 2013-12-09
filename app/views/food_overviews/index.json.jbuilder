json.array!(@food_overviews) do |food_overview|
  json.extract! food_overview, :id
  json.url food_overview_url(food_overview, format: :json)
end
