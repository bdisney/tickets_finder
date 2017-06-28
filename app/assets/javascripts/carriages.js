$(document).ready(function() {
    $('.hidden_carriage').hide();

    var carriageSelector = $('#carriage_type');
    var carriageDiv = '.' + carriageSelector.val();

    $(carriageDiv).show();

    $(carriageSelector).change(function() {
        $('.hidden_carriage').hide();
        var carriageDiv = '.' + carriageSelector.val();
        $(carriageDiv).show();
    });
});