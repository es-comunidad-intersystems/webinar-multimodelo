import { Component, OnInit } from '@angular/core';
import { Director } from '../model/director';
import { CarteleraService } from '../service/cartelera.service';
import { NGXLogger } from 'ngx-logger';

@Component({
  selector: 'app-directores',
  templateUrl: './directores.component.html',
  styleUrls: ['./directores.component.css']
})
export class DirectoresComponent implements OnInit {

  directores: Director[];

  constructor(
    private carteleraService: CarteleraService,
    private logger: NGXLogger
  ) {
    this.carteleraService = carteleraService;
  }

  ngOnInit() {
    this.carteleraService.cargaDirectores().subscribe(
      directores => {
        this.directores = directores;
      },
      error => {
        this.logger.error(error);
      },
      () => {

      }
    );
  }

}
