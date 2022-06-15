import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ModalCreateEditClienteComponent } from './modal-create-edit-cliente.component';

describe('ModalCreateEditClienteComponent', () => {
  let component: ModalCreateEditClienteComponent;
  let fixture: ComponentFixture<ModalCreateEditClienteComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ ModalCreateEditClienteComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(ModalCreateEditClienteComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
