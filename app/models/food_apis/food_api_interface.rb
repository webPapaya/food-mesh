class FoodAPIInterface
  def search (query)
    raise NotImplementedError, "search is not implemented"
  end

  def get_item (id)
    raise NotImplementedError, "get_item is not implemented"
  end
end