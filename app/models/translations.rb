require 'rubygems'
require 'bing_translator'

class Translations
  def initialize local_from = 'de', local_to = 'en'
    @translator  = BingTranslator.new('MKnQJZvv0U4edzMy', 'MKnQJZvv0U4edzMyXua0/xEEHC9ZNZdN6lQVzaWu9I0=')
    @local_from = local_from
    @local_to = local_to
  end

  ##
  # translates a given array or string
  def translate names

    if names.class == String
      return translate_string names
    elsif names.class == Array
      return translate_arr(names).split('|')
    end

    nil
  end

  private
  def translate_string (string)
    @translator.translate string, :from => @local_from, :to => @local_to
  end

  def translate_back (string)
    @translator.translate string, :from => @local_to, :to => @local_from

  end

  def translate_arr arr
    arr_string = concat_names arr
    translate_back arr_string
  end

  def concat_names names
    names.join('|')
  end

  def split_translations names
    names.split('|')
  end
end
