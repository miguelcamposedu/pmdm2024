$(document).ready(function () {

    var abecedario = ['A', 'B', 'C', 'D',];

    $('#first_name').val('Miguel');
    $('#last_name').val('Campos');
    $('#email').val('miguel@email.com');
    $('#sex').val('female');
    $('#col-sex-other').hide();
    $('#text-intro').text('lipsum');

    $(document).on('change', '#sex', function () {
        if ($(this).val() == 'other') {
            $('#col-sex-other').show();
        } else {
            $('#sex_other').val('');
            $('#col-sex-other').hide();
        }
    });
});