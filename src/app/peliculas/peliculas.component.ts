import { Component, OnInit } from '@angular/core';
import { CarteleraService } from '../service/cartelera.service';
import { Pelicula } from '../model/pelicula';
import { NGXLogger } from 'ngx-logger';

@Component({
  selector: 'app-peliculas',
  templateUrl: './peliculas.component.html',
  styleUrls: ['./peliculas.component.css']
})
export class PeliculasComponent implements OnInit {

  peliculas: Pelicula[];

  constructor(
    private carteleraService: CarteleraService,
    private logger: NGXLogger
  ) {
    this.carteleraService = carteleraService;
  }

  ngOnInit() {
    this.carteleraService.cargaPeliculas().subscribe(
      peliculas => {
        this.peliculas = peliculas;
      },
      error => {
        this.logger.error(error);
      },
      () => {

      }
    );
  }

}
