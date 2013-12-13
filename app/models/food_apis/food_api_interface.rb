class FoodAPIInterface
  def search (api_key, query)
    raise NotImplementedError, "search is not implemented"
  end

  def get_item (id)
    raise NotImplementedError, "get_item is not implemented"
  end
end