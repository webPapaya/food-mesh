module FoodAPIsHelper
  ##translations
  def translate_key key, local
    translation = key.downcase
    translation.slice! 'nf_'
    translation = I18n.t translation, locale: local

    translation
  end
end