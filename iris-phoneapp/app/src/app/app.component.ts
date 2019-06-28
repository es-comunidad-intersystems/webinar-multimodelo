import { Component, OnInit } from '@angular/core';
import { PhoneService } from './phone.service';
import { Phone } from './phone';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent implements OnInit {

  phones: Phone[];

  constructor(private phoneService: PhoneService) {
  }

  ngOnInit() {
    this.phoneService.getPhones().subscribe(
      phones => {
        this.phones = phones;
      },
      error => {
        console.error(error);
      }
    );
  }

}
