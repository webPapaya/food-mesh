class SearchLocalRemote
  include FoodApisModule

  def search query
    local_search = Search.search query
    return local_search unless (local_search.nil?)

    remote_search = search_apis query
    return remote_search unless (remote_search.nil?)

    nil #fallback
  end

  def get_item item_id
    local_item = FoodItem.get_local_item item_id
    return local_item unless (local_item.nil?)

    item_id = item_id.split('-')
    remote_item = get_remote_item item_id[0], item_id[1]
    return remote_item unless (remote_item.nil?)

    nil #fallback
  end
end
