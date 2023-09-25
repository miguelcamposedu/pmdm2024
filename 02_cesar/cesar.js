$(document).ready(() => {
    const alphabet = ["A", "B", "C", "D", "E", "F", "G", "H", "I", "J", "K", "L", "M", "N", "Ñ", "O", "P", "Q", "R", "S", "T", "U", "V", "W", "X", "Y", "Z"];
    // Declaro un evento para gestionar el evento click del botón "Encode message"
    $(document).on('click', '#btn_encode', function () {
        // console.log('entra en evento click');
        resetFields();

        if ($('#message').val() == '') {
            $('#message').addClass('is-invalid');
        } else {
            var encodedMessage = encodeMessage();
            $('#result_message').text(encodedMessage);
        }
    });

    function resetFields() {
        $('#message').removeClass('is-invalid');
    }

    function encodeMessage() {
        var result = '';
        var messageToEncode = $('#result_message').val().toUpperCase();
        var messageArray = messageToEncode.split('');

        debugger;

        for (var letter of messageArray) {
            if (letter == ' ') {
                result += ' ';
            } else {
                var letterPosition = alphabet.indexOf(letter);
                if (letterPosition == -1) {
                    result += letter;
                } else {
                    var letterPositionInc = letterPosition + 3;
                    var letterCypherPosition = letterPositionInc % alphabet.length
                    var cypheredLetter = alphabet[letterCypherPosition];
                    result += cypheredLetter;
                }
            }
        }

        return result;
    }
});