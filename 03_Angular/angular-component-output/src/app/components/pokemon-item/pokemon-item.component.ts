import { Component, EventEmitter, Input, Output } from '@angular/core';
import { Pokemon } from 'src/app/models/pokemon-detail.interface';

@Component({
  selector: 'app-pokemon-item',
  templateUrl: './pokemon-item.component.html',
  styleUrls: ['./pokemon-item.component.css']
})
export class PokemonItemComponent {
  @Input() pokemon!: Pokemon;
  @Output() pokemonClick = new EventEmitter<string>();

  getPokemonImage() {
    const pokemonId = this.pokemon.url.split('/')[6];
    return `https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/${pokemonId}.png`;
  }

  viewPokemonDetail() {
    this.pokemonClick.emit(this.pokemon.name);
  }
}
