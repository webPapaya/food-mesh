require 'food_apis_module'
require 'rubygems'
require 'bing_translator'

class FoodOverviewsController < ApplicationController
  include FoodApisModule #include all functions from foodAPIs Module

  def index
    translator = BingTranslator.new('MKnQJZvv0U4edzMy', 'MKnQJZvv0U4edzMyXua0/xEEHC9ZNZdN6lQVzaWu9I0=')
    names = Array.new
    @results = search_apis params[:query]
    @results.each_with_index do |result, index|
        names[index] = result[:name]
        ap names[index]

        #To translate all food names to spanish
    end
    names.each_with_index do |name, index|
      @laguage = translator.translate names[index], :from => 'en', :to => 'fr'
      ap @laguage
    end
  end

  def show
    api_id = params[:api_id].to_i
    food_id = params[:food_id]
    @results = get_item(api_id, food_id)
    ap names = params[:name]

    pie_chart_instance = PieChart.new @results[:nutritions]
    @pie_chart = pie_chart_instance.get_pie_chart
  end

  def redirect_to_index
    redirect_to :controller => 'food_overviews', :action => 'index', :query => params[:query]
  end
end
