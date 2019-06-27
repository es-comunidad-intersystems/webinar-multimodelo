import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { PeliculasComponent } from './peliculas/peliculas.component';
import { ActoresComponent } from './actores/actores.component';
import { DirectoresComponent } from './directores/directores.component';

const routes: Routes = [
  { path: '', component: PeliculasComponent },
  { path: 'peliculas', component: PeliculasComponent },
  { path: 'actores', component: ActoresComponent },
  { path: 'directores', component: DirectoresComponent }
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
