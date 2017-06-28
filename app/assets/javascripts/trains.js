$(document).ready(function() {
    $('a.edit_train').click(function(e) {
        e.preventDefault();

        var train_id;
        var number;
        var form;

        train_id = $(this).data('trainId');
        form = $('#edit_train_' + train_id);
        number = $('#train_number_' + train_id);

        if (!$(this).hasClass('cancel')) {
            $(this).html('<span class="text-danger"><i class="fa fa-ban"></i></span>');
            $(this).addClass('cancel');
        } else {
            $(this).html('<span class="text-success"><i class="fa fa-pencil"></i></span>');
            $(this).removeClass('cancel');
        };

        form.toggle();
        number.toggle();

    });
});