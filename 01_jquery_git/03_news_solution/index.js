console.log('entra');

$(document).ready(function () {
    var n1, n2;

    // Seteo en los <span> los números n1 y n2
    generateRandomSum();

    $(document).on('click', '#btnSave', function () {

        var title = $('#title').val();
        var description = $('#description').val();
        var slug = $('#slug').val();
        var robot = $('#robot-check').val();

        // Elimino los errores que hubiera previamente
        $('.form-control').removeClass('is-invalid');

        var isValidForm = true;

        if (title == '') {
            isValidForm = false;
            $('#title').addClass('is-invalid');
        }

        if (description == '') {
            isValidForm = false;
            $('#description').addClass('is-invalid');
        }

        if (slug == '') {
            isValidForm = false;
            $('#slug').addClass('is-invalid');
        }

        if (robot == '' || checkSuma() == false) {
            isValidForm = false;
            $('#robot-check').addClass('is-invalid');
        }

        if (isValidForm == true) {
            alert('Perfecto, vamos a publicar tu noticia!');
        } else {
            $('#robot-check').val('');
            generateRandomSum();
        }

    });

    $(document).on('click', '#btnAutogenerate', function () {
        var title = $('#title').val();
        if (title == '') {
            $('#title').addClass('is-invalid');
        } else {
            const regex = / /g;
            var urlGenerated = title.toLowerCase().trim().replace(regex, '-');
            $('#slug').val(urlGenerated);
        }
    });

    function generateRandomSum() {
        n1 = between(0, 10);
        n2 = between(0, 10);
        $('#n1').text(n1);
        $('#n2').text(n2);
    }

    function checkSuma() {
        return parseInt($('#robot-check').val()) == n1 + n2 ? true : false;
    }

    function between(min, max) {
        return Math.floor(
            Math.random() * (max - min) + min
        )
    }

});