import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { ActoresComponent } from './actores.component';

describe('ActoresComponent', () => {
  let component: ActoresComponent;
  let fixture: ComponentFixture<ActoresComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ ActoresComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(ActoresComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
