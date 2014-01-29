require 'test_helper'

class TranslationsTest < ActiveSupport::TestCase
  def setup

  end


    test "get translation for beer" do
        @translator = Translations
        #translation = @translator.translate 'bier'
        #assert translation == 'beer'
    end
end
