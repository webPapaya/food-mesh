class Translations
  @translator  = BingTranslator.new('MKnQJZvv0U4edzMy', 'MKnQJZvv0U4edzMyXua0/xEEHC9ZNZdN6lQVzaWu9I0=')

  ##
  # translates a given array
  def self.translate names, local_from, local_to = 'en'
    (names = self.concat_names names) unless (names.class == String)
    translations = @translator.translate names, :from => local_from, :to => local_to
    #split_translations translations
  end

  def self.concat_names names
    names.join ' ||| '
  end

  def self.split_translations names
    names.split ' ||| '
  end
end
