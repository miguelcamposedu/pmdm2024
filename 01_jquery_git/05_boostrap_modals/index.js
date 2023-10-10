$(document).ready(function () {

    var url = 'https://pokeapi.co/api/v2/pokemon/500/';
    console.log(getPokemonIdFromUrl(url));

    $(document).on('click', '.btn-view-pokemon', function () {
        var pokemonId = $(this).attr('itemid');

        $.ajax({
            url: `https://pokeapi.co/api/v2/pokemon/${pokemonId}`,
            type: 'GET',
        }).done(function (response) {
            // Lo primero setear toda la información que quiero pintar en el modal
            specie1 = response.types[0].type.name;
            $('#pokemon_name').text(response.name + ' - ' + specie1);

            // Lo último es abrir el modal
            $('#pokemon_detail_modal').modal('show');
        });

    });

    function getPokemonIdFromUrl(url) {
        // Sacar id de la url de pokemon
        return url.split('/').reverse()[1];
    }

});