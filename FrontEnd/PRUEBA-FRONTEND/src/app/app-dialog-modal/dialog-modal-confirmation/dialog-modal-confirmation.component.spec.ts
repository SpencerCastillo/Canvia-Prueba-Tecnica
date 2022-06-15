import { ComponentFixture, TestBed } from '@angular/core/testing';

import { DialogModalConfirmationComponent } from './dialog-modal-confirmation.component';

describe('DialogModalConfirmationComponent', () => {
  let component: DialogModalConfirmationComponent;
  let fixture: ComponentFixture<DialogModalConfirmationComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ DialogModalConfirmationComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(DialogModalConfirmationComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
