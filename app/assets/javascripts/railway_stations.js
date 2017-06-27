$(document).ready(function() {
    $('a.edit_station').click(function(e) {
        e.preventDefault();

        var station_id;
        var form;
        var title;

        station_id = $(this).data('stationId');
        form = $('#edit_railway_station_' + station_id);
        title = $('#railway_station_title_' + station_id);

        if (!$(this).hasClass('cancel')) {
            $(this).html('<span class="text-danger"><i class="fa fa-ban"></i></span>');
            $(this).addClass('cancel');
        } else {
            $(this).html('<span class="text-success"><i class="fa fa-pencil"></i></span>');
            $(this).removeClass('cancel');
        };

        form.toggle();
        title.toggle();
    });
});