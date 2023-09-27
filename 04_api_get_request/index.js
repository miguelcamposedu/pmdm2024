$(document).ready(function () {
    $.ajax({
        url: 'https://pokeapi.co/api/v2/pokemon',
        type: 'GET'
    }).done(function (resp) {
        var listadoPomemon = resp.results;
        listadoPomemon.forEach(function (pokemon) {
            // var template = '<p><h1>' + pokemon.name + '</h1></p>';
            var template = `<p><h1>${pokemon.name}</h1></p>`;
            $('#lista-pokemon').append(template);
        });
    });

});