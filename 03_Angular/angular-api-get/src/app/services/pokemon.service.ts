import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { PokemonListResponse } from '../models/pokemon-list.interface';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class PokemonService {

  // La variable se llama 'http', pero puede llamarse p.e. 'cliente'
  constructor(private http: HttpClient) { }

  getPokemonList(): Observable<PokemonListResponse> {
    return this.http.get<PokemonListResponse>('https://pokeapi.co/api/v2/pokemon');
  }
}
