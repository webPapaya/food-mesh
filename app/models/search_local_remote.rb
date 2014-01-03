##
# university:  University of Applied Sciences Salzburg
# studie:      MultiMediaTechnology
# usage:	     Multimediaprojekt 2a (MMP2a)
# @author:     - Thomas Mayrhofer (thomas@mayrhofer.at)

class SearchLocalRemote
  include FoodApisModule
  def initialize
    @translation_enabled = false
  end

  def self.get_single_item item_id
    local_remote = SearchLocalRemote.new
    local_remote.get_item item_id
  end

  def self.search_items query
    local_remote = SearchLocalRemote.new
    local_remote.search query
  end



  def search(query)
    @query = query
    @items = gather_search
    @translations = get_batch_translations if @translation_enabled

    {
        :items => @items,
        :translations => @translations
    }
  end

  def get_item (item_id)
    @item_id = item_id
    @item    = gather_item
    return gather_translation if @translation_enabled
    @item
  end



  private
  ##
  # returns a single item from local database if it exists
  # if not this funktion asks the remote apis for the element
  # and saves the element in the db (so the next time someone requests this
  # item it will be loaded from our local database)
  # if the element does not exist it returns nil
  def gather_item
    local_item = FoodItem.get_local_item @item_id
    return local_item unless (local_item.nil?)

    item_id = @item_id.split('-')
    remote_item = get_remote_item item_id[0], item_id[1]
    remote_item = FoodItem.new_item remote_item

    return remote_item unless (remote_item.nil?)

    nil #fallback
  end

  ##
  # main search methode
  # asks search database if search query was already performed
  # if the search query was not performed in the past it asks the apis to find elements
  # all remote elements will be written to db
  def gather_search
    local_search = Search.search @query
    unless local_search.nil?
      local_search = FoodItem.get_local_items local_search['food_items']
      return local_search unless (local_search.nil?)
    end

    remote_search = search_apis @query   # adds searches remote end for elements
    unless remote_search.nil?
      Search.add @query, remote_search     # adds elements to search
      add_multiple_food_items remote_search unless remote_search.nil?
      return remote_search unless (remote_search.nil?)
    end

    nil #fallback
  end


  def gather_translation
    locale = I18n.locale.to_s
    unless FoodItem.has_translation? @item, locale
      translator = Translations.new 'en', locale
      name = translator.translate @item['name']
      FoodItem.add_translation_to_item! @item, locale, name
    end






    @item['name'] = FoodItem.get_translation @item, locale
    @item
  end


  def get_batch_translations
    to_translate = []
    locale = I18n.locale.to_s

    translator = Translations.new 'en', locale
    @items.each do |item|
      to_translate << item['name']
    end


    t = translator.translate to_translate
    ap t
    t
  end

  ##
  # loops through all elements and writes it to the database
  # todo should be placed in food_item.rb (should auto detect if single element or multiple elements are passed in new item function)
  def add_multiple_food_items items
    items.each do |item|
      FoodItem.new_item item
    end
  end
end
