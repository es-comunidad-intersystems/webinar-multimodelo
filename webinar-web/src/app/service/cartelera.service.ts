import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Pelicula } from '../model/pelicula';
import { Observable } from 'rxjs';
import { environment } from '../../environments/environment';
import { Actor } from '../model/actor';
import { Director } from '../model/director';

@Injectable({
  providedIn: 'root'
})
export class CarteleraService {

  private apiUrl = environment.apiUrl;

  constructor(private http: HttpClient) { }

  cargaPeliculas(): Observable<Pelicula[]> {
    return this.http.get<Pelicula[]>(`${this.apiUrl}/peliculas`);
  }

  cargaActores(): Observable<Actor[]> {
    return this.http.get<Actor[]>(`${this.apiUrl}/actores`);
  }

  cargaDirectores(): Observable<Director[]> {
    return this.http.get<Director[]>(`${this.apiUrl}/directores`);
  }
}
