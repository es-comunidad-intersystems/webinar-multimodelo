import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';

import { AppComponent } from './app.component';
import { MainModule } from './main/main.module';
import { AppRoutingModule } from './/app-routing.module';
import { PeliculasComponent } from './peliculas/peliculas.component';
import { ActoresComponent } from './actores/actores.component';
import { HttpClientModule } from '@angular/common/http';
import { LoggerModule, NgxLoggerLevel } from 'ngx-logger';
import { DirectoresComponent } from './directores/directores.component';

@NgModule({
  declarations: [
    AppComponent,
    PeliculasComponent,
    ActoresComponent,
    DirectoresComponent
  ],
  imports: [
    BrowserModule,
    MainModule,
    AppRoutingModule,
    HttpClientModule,
    LoggerModule.forRoot({
      level: NgxLoggerLevel.ERROR
    }),
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
