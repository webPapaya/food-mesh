/**
 * jquery.tabs.js
 *
 * university:  University of Applied Sciences Salzburg
 * studie:      MultiMediaTechnology
 * usage:	    Multimediaprojekt 2a (MMP2a)
 * author:      - Thomas Mayrhofer (thomas@mayrhofer.at)
 *
 * About this file:
 * ----------------
 * this is a simple jquery plugin for changing the sidebar menu
 */


(function($) {
    var PieChart = function(element, options) {
        this.$element = $(element);
        this.$pieElements = this.$element.find('.pie-item');
        this.$pieItems = this.$element.find('.pie-path-back');



        this.$pieItems.hoverIntent(this.mouseOverEvent.bind(this),  this.mouseLeaveEvent.bind(this));


    };

    PieChart.prototype.mouseLeaveEvent = function(evt) {
        this.$pieElements.children('text').animate({
            opacity: 1
        });
    };

    PieChart.prototype.mouseOverEvent = function(evt) {
        var $currentTarget = $(evt.currentTarget);
        var $parrentWrapper = $currentTarget.closest('g');
        var $text = $parrentWrapper.children('text');


        this.hideAllLabels($parrentWrapper.attr('id'));

        $text.animate({
            opacity: 1
        });
    };

    PieChart.prototype.hideAllLabels = function(id) {
        this.$pieElements.not('#' + id).children('text').animate({
            opacity: 0
        })

    };

    $.fn.PieChart = function(options) {
        return this.each(function() {
            var $this = $(this);
            var data = $this.data('PieChart');
            if (!data) {
                $this.data('PieChart', (data = new PieChart($this, options)));
            }
        });
    };
})(jQuery);