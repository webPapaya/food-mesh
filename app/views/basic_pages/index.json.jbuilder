json.array!(@basic_pages) do |basic_page|
  json.extract! basic_page, :title, :body
  json.url basic_page_url(basic_page, format: :json)
end
