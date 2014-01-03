require 'food_apis_module'

class FoodItemController < ApplicationController
  before_filter :before_actions
  include FoodApisModule

  def show
    @food_item = @local_remote.get_item params[:item_id]

    pie_chart_instance = PieChart.new @food_item[:nutritions]
    @pie_chart = pie_chart_instance.get_pie_chart
  end

  def search
    translation_en = @translator.translate params[:query]
    @food_items = @local_remote.search translation_en

    tmp = []
    @food_items.each do |item|
      tmp << item['name']
    end

    @name_translation = @translator.translate tmp
  end

  def compare
    @food_items = user_session.get_user_items
    @chart = LineChart.get_chart @food_items
  end

  def redirect_to_index
    redirect_to search_db_path params[:query]
  end

  private
  def before_actions
    @translator = Translations.new params[:locale]
    @local_remote = SearchLocalRemote.new
  end
end
