##
# food_item_controller.rb
#
# university:  University of Applied Sciences Salzburg
# studie:      MultiMediaTechnology
# usage:	    Multimediaprojekt 2a (MMP2a)
# author:      - Thomas Mayrhofer (thomas@mayrhofer.at)
#              - Franziska Oberhauser

require 'food_apis_module'

class FoodItemController < ApplicationController
    before_filter :before_actions
    include FoodApisModule

    # @todo add a static member to PieChart get_chart so only one call for pie_chart is needed
    def show
        @food_item         = SearchLocalRemote.get_single_item params[:item_id]
        recalculation      = IntakeCalculations.instance.get_recalculated_infos @food_item[:nutritions]
        pie_chart_instance = PieChart.new recalculation
        @pie_chart         = pie_chart_instance.get_pie_chart
    end

    def search
        translation_en = @translator.translate params[:query]
        food_items     = @local_remote.search translation_en

        @food_items       = food_items[:items]
        @name_translation = food_items[:translations]
    end

    def compare
        @food_items = user_session.get_user_items
        @chart = LineChart.get_chart @food_items unless @food_items.empty?
        ap @chart
    end

    def redirect_to_index
        set_current_locale
        redirect_to search_db_path params[:query]
    end

    def clear_search_cache
        if logged_in?
            Search.clear_cache
        end
        redirect_to dashboard_path, :notice => 'Cleared search cache'
    end

    private
    def before_actions
        @translator   = Translations.new params[:locale]
        @local_remote = SearchLocalRemote.new
    end
end
