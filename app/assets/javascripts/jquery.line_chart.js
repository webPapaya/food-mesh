

(function($) {
    var LineChart = function(element, options) {





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