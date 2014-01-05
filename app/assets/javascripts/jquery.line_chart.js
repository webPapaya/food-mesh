(function($) {
    var LineChart = function(element, options) {
        this.$element = $(element);
        this.$paths = this.$element.find('.line-chart-line');
        this.$sidebar = $('#header-dropdown-wrp');

        //put in own function
        for(path in this.$paths.get()) {
            this.animatePath(this.$paths[path]);
            itemCount = ("path:", this.$paths.length);
        }


        this.$paths.on("mouseover", this.highLightSidebar.bind(this));
    };

    LineChart.prototype.highLightSidebar = function(evt) {
        var currentElement = $(evt.currentTarget);
        var currentId = currentElement.attr('id').replace(/item-/g,"");

        var sidebarElement = this.$sidebar.find("[data-item-idx='" + currentId + "']");

        sidebarElement.css('background', '#2ba772');

        console.log(sidebarElement);
        console.log(currentId);

        $(evt.currentTarget).on('mouseleave', (function(evt){
            $(evt.currentTarget).off('mouseleave');
            sidebarElement.css('background', '');
        }).bind(this));
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