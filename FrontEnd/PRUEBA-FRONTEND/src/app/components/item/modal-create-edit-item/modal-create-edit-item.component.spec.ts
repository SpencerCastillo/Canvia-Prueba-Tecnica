import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ModalCreateEditItemComponent } from './modal-create-edit-item.component';

describe('ModalCreateEditItemComponent', () => {
  let component: ModalCreateEditItemComponent;
  let fixture: ComponentFixture<ModalCreateEditItemComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ ModalCreateEditItemComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(ModalCreateEditItemComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
