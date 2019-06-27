import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { SidenavTogglerComponent } from './sidenav-toggler.component';

describe('SidenavTogglerComponent', () => {
  let component: SidenavTogglerComponent;
  let fixture: ComponentFixture<SidenavTogglerComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ SidenavTogglerComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(SidenavTogglerComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
