import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { SidenavComponent } from './sidenav/sidenav.component';
import { TopnavComponent } from './topnav/topnav.component';
import { SidenavTogglerComponent } from './sidenav-toggler/sidenav-toggler.component';
import { RouterModule } from '@angular/router';

@NgModule({
  imports: [
    CommonModule,
    RouterModule
  ],
  declarations: [SidenavComponent, TopnavComponent, SidenavTogglerComponent],
  exports: [
    SidenavComponent,
    TopnavComponent,
    SidenavTogglerComponent
  ]
})
export class MainModule { }
