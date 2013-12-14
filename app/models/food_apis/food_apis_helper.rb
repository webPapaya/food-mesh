module FoodAPIsHelper
  ##translations
  def translate_key key, local
    key.downcase
    key = I18n.t key, locale: local

    key
  end
end