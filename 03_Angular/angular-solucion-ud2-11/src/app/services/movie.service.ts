import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { MoviePopularResponse } from '../models/movie-popular.interface';
import { MovieTopRated, MovieTopRatedResponse } from '../models/movie-top-rated.interface';
import { MovieDetailResponse } from '../models/movie-detail.interface';
import { environment } from 'src/environments/environment.development';

const MOVIE_BASE_URL = 'movie';

@Injectable({
  providedIn: 'root'
})
export class MovieService {

  constructor(private http: HttpClient) { }

  getPopular(): Observable<MoviePopularResponse> {
    return this.http.get<MoviePopularResponse>(`${environment.apiBaseUrl}/${MOVIE_BASE_URL}/popular?api_key=${environment.apiKey}`);
  }

  getTopRated(): Observable<MovieTopRatedResponse> {
    return this.http.get<MovieTopRatedResponse>(`${environment.apiBaseUrl}/${MOVIE_BASE_URL}/top_rated?api_key=${environment.apiKey}`);
  }

  getMovie(id: number): Observable<MovieDetailResponse> {
    return this.http.get<MovieDetailResponse>(`${environment.apiBaseUrl}/${MOVIE_BASE_URL}/${id}?api_key=${environment.apiKey}`);
  }
}
