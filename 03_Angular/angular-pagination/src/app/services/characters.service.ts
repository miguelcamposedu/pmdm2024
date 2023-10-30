import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { CharacterListResponse } from '../models/character-list.interface';

@Injectable({
  providedIn: 'root'
})
export class CharactersService {

  constructor(private http: HttpClient) { }

  getAllCharacters(page: number): Observable<CharacterListResponse> {
    return this.http.get<CharacterListResponse>(`https://rickandmortyapi.com/api/character?page=${page}`);
  }
}
