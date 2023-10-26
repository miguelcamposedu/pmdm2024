import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { PeopleListResponse } from '../models/people-list.interface';
import { Observable } from 'rxjs';

@Injectable({
  providedIn: 'root'
})
export class PeopleService {

  constructor(private http: HttpClient) { }

  getPeopleList(): Observable<PeopleListResponse> {
    return this.http.get<PeopleListResponse>('https://swapi.dev/api/people');
  }

  getPersonDetail(id: number) {

  }
}
