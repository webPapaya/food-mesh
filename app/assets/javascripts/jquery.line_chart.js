/**
 * jquery.line_chart.js
 *
 * university:  University of Applied Sciences Salzburg
 * studie:      MultiMediaTechnology
 * usage:	    Multimediaprojekt 2a (MMP2a)
 * author:      - Thomas Mayrhofer (thomas@mayrhofer.at)
 *              - Franziska Oberhauser
 */


(function($) {
    var LineChart = function(element, options) {
        this.$element = $(element);
        this.$paths = this.$element.find('.line-chart-line');
        this.$itemName = $('.span_4');

        //put in own function
        for(path in this.$paths.get()) {
            this.animatePath(this.$paths[path]);
            itemCount = ("path:", this.$paths.length);
        }

        this.$paths.on("mouseover", this.highLightItemName.bind(this));
        this.$itemName.on("mouseover", this.moveLineChartLine.bind(this));
    };

    LineChart.prototype.highLightItemName = function(evt) {
        var currentElement = $(evt.currentTarget);
        var currentId = currentElement.attr('id').replace(/item-/g,"");

        var itemNameElement = this.$itemName.find("[data-item-idx='" + currentId + "']");

        itemNameElement.css('background', '#6BC19C');

        //console.log(itemNameElement);
        //console.log(currentId);

        $(evt.currentTarget).on('mouseleave', (function(evt){
            $(evt.currentTarget).off('mouseleave');
            itemNameElement.css('background', '');
        }).bind(this));
    };

    LineChart.prototype.moveLineChartLine = function(evt) {
        var currentElement = $(evt.currentTarget);
        var currentId = currentElement.attr('id');
        console.log(currentId);
    };

    LineChart.prototype.animatePath = function(path) {
        var length = path.getTotalLength();

        // clear previous transition
        path.style.transition = path.style.WebkitTransition = 'none';

        // starting positions
        path.style.strokeDasharray = length + ' ' + length;
        path.style.strokeDashoffset = length;

        // trigger a layout
        path.getBoundingClientRect();

        // define transition
        path.style.transition = path.style.WebkitTransition = 'stroke-dashoffset '+ Math.random()*3 + 's ease-in-out';

        path.style.strokeDashoffset = '0';

    };

    $.fn.LineChart = function(options) {
        return this.each(function() {
            var $this = $(this);
            var data = $this.data('LineChart');
            if (!data) {
                $this.data('LineChart', (data = new LineChart($this, options)));
            }
        });
    };
})(jQuery);