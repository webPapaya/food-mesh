json.array!(@single_pages) do |single_page|
  json.extract! single_page, :id
  json.url single_page_url(single_page, format: :json)
end
