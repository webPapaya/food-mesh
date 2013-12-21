$(function () {
    $(window).stellar();

    $("#header-wrp .search-form-wrp input").on("click", function(){
        $("#form-suggestion-overlay").toggleClass("overlay-hide");
    });

});