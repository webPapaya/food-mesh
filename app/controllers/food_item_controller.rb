require 'food_apis_module'

class FoodItemController < ApplicationController
  before_filter :before_actions
  include FoodApisModule


  ##
  # @todo this controller will be removed because its just for testing propose
  def index
    @food_item = FoodItem.get_all_items

    #respond_to do |format|
    #  format.html { redirect_to :back }
    #  format.js { render "#{params[:locale]}/food_item/search" }
    #end
  end

  def show
    #"#{params[:api_key]}-#{params[:food_id]}"
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
