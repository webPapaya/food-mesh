##
# university:  University of Applied Sciences Salzburg
# studie:      MultiMediaTechnology
# usage:	     Multimediaprojekt 2a (MMP2a)
# @author:     - Thomas Mayrhofer (thomas@mayrhofer.at)

class SearchLocalRemote
  include FoodApisModule

  ##
  # main search methode
  # asks search database if search query was already performed
  # if the search query was not performed in the past it asks the apis to find elements
  # all remote elements will be written to db
  def search query
    local_search = Search.search query

    return local_search unless (local_search.nil?)

    remote_search = search_apis query
    add_multiple_food_items remote_search unless remote_search.nil?
    return remote_search unless (remote_search.nil?)

    nil #fallback
  end

  ##
  # returns a single item from local database if it exists
  # if not this funktion asks the remote apis for the element
  # and saves the element in the db (so the next time someone requests this
  # item it will be loaded from our local database)
  # if the element does not exist it returns nil
  def get_item item_id
    local_item = FoodItem.get_local_item item_id
    return local_item unless (local_item.nil?)

    item_id = item_id.split('-')
    remote_item = get_remote_item item_id[0], item_id[1]
    FoodItem.new_item remote_item
    return remote_item unless (remote_item.nil?)

    nil #fallback
  end

  private

  ##
  # loops through all elements and writes it to the database
  # todo should be placed in food_item.rb (should auto detect if single element or multiple elements are passed in new item function)
  def add_multiple_food_items items
    items.each do |item|
      FoodItem.new_item item
    end
  end
end
