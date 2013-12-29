require 'food_apis_module'
require 'rubygems'
require 'bing_translator'

class FoodOverviewsController < ApplicationController
  include FoodApisModule #include all functions from foodAPIs Module

  def index
    translation_en = Translations.translate params[:query], 'de'
    @results = search_apis translation_en
    #translate_food_names @results
  #end

  #def translate_food_names results

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
