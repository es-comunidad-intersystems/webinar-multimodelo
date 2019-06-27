import { TestBed, inject } from '@angular/core/testing';

import { CarteleraService } from './cartelera.service';

describe('CarteleraService', () => {
  beforeEach(() => {
    TestBed.configureTestingModule({
      providers: [CarteleraService]
    });
  });

  it('should be created', inject([CarteleraService], (service: CarteleraService) => {
    expect(service).toBeTruthy();
  }));
});
