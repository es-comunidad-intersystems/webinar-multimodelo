import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { environment } from 'src/environments/environment';
import { Observable } from 'rxjs';
import { Phone } from './phone';

@Injectable({
  providedIn: 'root'
})
export class PhoneService {

  private apiUrl = environment.apiUrl;

  constructor(private http: HttpClient) { }

  getPhones(): Observable<Phone[]> {
    return this.http.get<Phone[]>(`${this.apiUrl}/phones`);
  }
}
