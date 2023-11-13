import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Observable } from 'rxjs';
import { environment } from 'src/environments/environment.development';
import { GetRequestTokenResponse } from '../models/get-resquest-token.interface';
import { CreateSessionResponse } from '../models/create-session.interface';

@Injectable({
  providedIn: 'root'
})
export class AuthService {

  constructor(private http: HttpClient) { }

  getRequestToken(): Observable<GetRequestTokenResponse> {
    return this.http.get<GetRequestTokenResponse>(`${environment.apiBaseUrl}/authentication/token/new`, {
      headers: {
        'Authorization': `Bearer ${environment.tmdbToken}`
      }
    });
  }

  createSession(token: string): Observable<CreateSessionResponse> {
    return this.http.post<CreateSessionResponse>(`${environment.apiBaseUrl}/authentication/session/new`,
      {
      request_token: token
      },
      {
        headers: {
          'Content-Type': 'application/json',
          'Authorization': `Bearer ${environment.tmdbToken}`
        }
      }
    );
  }
}
