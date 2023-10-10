$(document).ready(function () {


    $.ajax({
        url: 'https://pokeapi.co/api/v2/pokemon',
        type: 'GET'
    }).done(function (resp) {
        var listadoPomemon = resp.results;
        listadoPomemon.forEach(function (pokemon) {
            // var template = '<p><h1>' + pokemon.name + '</h1></p>';
            var template = `<p><h1 class="pokemon" pokemonid="1">${pokemon.name}</h1></p>`;
            $('#lista-pokemon').append(template);
        });
    });

    $(document).on('click', '.pokemon', function () {
        var pokemonId = $(this).attr('pokemonid');

        $.ajax({
            url: 'https://pokeapi.co/api/v2/pokemon/' + pokemonId,
            type: 'GET'
        }).done(function (resp) {
            // Primero limpiamos el modal
            $('#modal_nombre').html(resp.name);

            // Lo último es mostrar el modal
            $('#modal-detail').show();

        });

    });

});