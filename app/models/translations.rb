class Translations
  @translator  = BingTranslator.new('MKnQJZvv0U4edzMy', 'MKnQJZvv0U4edzMyXua0/xEEHC9ZNZdN6lQVzaWu9I0=')

  ##
  # translates a given array
  def self.translate names, local_from, local_to = 'en'
    @food_translation = @translator.translate names, :from => local_from, :to => local_to
  end

end
