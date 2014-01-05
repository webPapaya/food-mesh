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

        if(options.controll) {
            this.$controlles = $(options.controll);
            this.$controlItems = this.$controlles.find('.col');
            this.$controlItems.on('mouseenter',this.highLightPie.bind(this));
        }

        this.$pieItems.hoverIntent(this.mouseOverEvent.bind(this),  this.mouseLeaveEvent.bind(this));
    };

    PieChart.prototype.highLightPie = function(evt) {
        var dataReference = $(evt.currentTarget).data('pie-reference');
        var pieElement = this.$element.find('#' + dataReference + ' .pie-path');

        pieElement.css('fill', 'black');

        $(evt.currentTarget).on('mouseleave', (function(evt){
            $(evt.currentTarget).off('mouseleave');
            pieElement.css('fill', '');



        }).bind(this));
    };


    PieChart.prototype.mouseLeaveEvent = function(evt) {
        this.$pieElements.children('text').animate({
            opacity: 1
        });
    };

    PieChart.prototype.mouseOverEvent = function(evt) {
        var $currentTarget = $(evt.currentTarget);
        var $parrentWrapper = $currentTarget.closest('g');
        var $clipPath = $parrentWrapper.find('clippath circle');
        var $text = $parrentWrapper.children('text');

        this.hideAllLabels($parrentWrapper.attr('id'));

        $text.animate({
            opacity: 1
        }, {queue: false});

        $clipPath.animate({
            r: 0
        }, {queue: false});
    };

    PieChart.prototype.hideAllLabels = function(id) {
        this.$pieElements.not('#' + id).children('text').animate({
            opacity: 0.1
        });
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