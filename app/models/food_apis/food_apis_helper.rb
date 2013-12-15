module FoodAPIsHelper
  ##translations
  def translate_key key, local
    translation = key.downcase
    translation.slice! 'nf_'
    translation = I18n.t translation, locale: local

    translation
  end

  def create_food_item_structure item_details
    raise 'item name is nil' unless !item_details[:name].blank?
    raise 'item name is nil' unless !item_details[:api_key].blank?
    raise 'item name is nil' unless !item_details[:item_id].blank?
    raise 'item name is nil' unless !item_details[:object_source_id].blank?
    item_details[:nutritions] = {}

    item_details
  end
end