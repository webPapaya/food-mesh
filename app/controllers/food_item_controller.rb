require 'food_apis_module'

class FoodItemController < ApplicationController
  include FoodApisModule

  before_filter :create_search_object

  ##
  # @todo this controller will be removed because its just for testing propose
  def index
    @food_item = FoodItem.get_all_items

  end

  def show
    #"#{params[:api_key]}-#{params[:food_id]}"
    @food_item = @local_remote.get_item params[:item_id]

    pie_chart_instance = PieChart.new @food_item[:nutritions]
    @pie_chart = pie_chart_instance.get_pie_chart
  end

  def search
    translation_en = Translations.translate params[:query], 'de'
    @food_items = @local_remote.search translation_en
  end

  def redirect_to_index
    redirect_to search_db_path params[:query]
  end

  private
  def create_search_object
    @local_remote = SearchLocalRemote.new
  end


end
