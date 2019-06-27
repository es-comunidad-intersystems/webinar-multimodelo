import { Component, OnInit } from '@angular/core';
import { SidenavService } from 'src/app/service/sidenav.service';
import { Router } from '@angular/router';

@Component({
  selector: 'app-sidenav',
  templateUrl: './sidenav.component.html',
  styleUrls: ['./sidenav.component.css']
})
export class SidenavComponent implements OnInit {

  public selected: string;

  constructor(
    public sideNavService: SidenavService
  ) { }

  ngOnInit() {
  }

  selectOption(event: any) {
    this.selected = event.currentTarget.id;
  }
}
