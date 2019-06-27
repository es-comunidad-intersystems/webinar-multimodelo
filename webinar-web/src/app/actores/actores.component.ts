import { Component, OnInit } from '@angular/core';
import { Actor } from '../model/actor';
import { CarteleraService } from '../service/cartelera.service';
import { NGXLogger } from 'ngx-logger';

@Component({
  selector: 'app-actores',
  templateUrl: './actores.component.html',
  styleUrls: ['./actores.component.css']
})
export class ActoresComponent implements OnInit {

  actores: Actor[];

  constructor(
    private carteleraService: CarteleraService,
    private logger: NGXLogger
  ) {
    this.carteleraService = carteleraService;
  }

  ngOnInit() {
    this.carteleraService.cargaActores().subscribe(
      actores => {
        this.actores = actores;
      },
      error => {
        this.logger.error(error);
      },
      () => {

      }
    );
  }
}
