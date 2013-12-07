module FoodAPIsHelper
  ##translations
  #
  def t key
    key = key.downcase
    I18n.t(key)
  end
end