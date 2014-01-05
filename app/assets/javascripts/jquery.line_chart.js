(function($) {
    var LineChart = function(element, options) {
        console.log(element)
        this.$element = $(element);
        this.$paths = this.$element.find('.line-chart-line');

        this.$paths.on("mouseover", (function(evt){
            console.log(evt);
            $headline = evt.innerHTML;
            console.log($headline);
        }).bind(this))

        for(path in this.$paths.get()) {
            this.animatePath(this.$paths[path]);
        }
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
        path.style.transition = path.style.WebkitTransition = 'stroke-dashoffset 2s ease-in-out';
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