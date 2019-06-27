import { async, ComponentFixture, TestBed } from '@angular/core/testing';

import { DirectoresComponent } from './directores.component';

describe('DirectoresComponent', () => {
  let component: DirectoresComponent;
  let fixture: ComponentFixture<DirectoresComponent>;

  beforeEach(async(() => {
    TestBed.configureTestingModule({
      declarations: [ DirectoresComponent ]
    })
    .compileComponents();
  }));

  beforeEach(() => {
    fixture = TestBed.createComponent(DirectoresComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
