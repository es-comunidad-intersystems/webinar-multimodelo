import { Component, OnInit } from '@angular/core';
import { SidenavService } from 'src/app/service/sidenav.service';

@Component({
  selector: 'app-sidenav-toggler',
  templateUrl: './sidenav-toggler.component.html',
  styleUrls: ['./sidenav-toggler.component.css']
})
export class SidenavTogglerComponent implements OnInit {

  constructor(
    public sideNavService: SidenavService
  ) { }

  ngOnInit() {
  }

}
