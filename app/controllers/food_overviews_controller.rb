require 'food_apis_module'
require 'rubygems'
require 'bing_translator'

class FoodOverviewsController < ApplicationController
  include FoodApisModule #include all functions from foodAPIs Module

  def index
    translator = BingTranslator.new('MKnQJZvv0U4edzMy', 'MKnQJZvv0U4edzMyXua0/xEEHC9ZNZdN6lQVzaWu9I0=')
    names = Array.new
    @food_translation = translator.translate params[:query], :from => 'de', :to => 'en'
    ap @food_translation

    @results = search_apis @food_translation
    @results.each_with_index do |result, index|
        names[index] = result[:name]
    end
    language = Array.new
    names.each_with_index do |name, index|
      language[index] = translator.translate names[index], :from => 'en', :to => 'hi'
    end
    @language = language
  end

  def show
    api_id = params[:api_id].to_i
    food_id = params[:food_id]
    @results = get_item(api_id, food_id)

    pie_chart_instance = PieChart.new @results[:nutritions]
    @pie_chart = pie_chart_instance.get_pie_chart
  end

  def redirect_to_index
    redirect_to :controller => 'food_overviews', :action => 'index', :query => params[:query]
  end
end
