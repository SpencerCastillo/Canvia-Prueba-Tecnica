import { ComponentFixture, TestBed } from '@angular/core/testing';

import { DialogModalInformationComponent } from './dialog-modal-information.component';

describe('DialogModalInformationComponent', () => {
  let component: DialogModalInformationComponent;
  let fixture: ComponentFixture<DialogModalInformationComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ DialogModalInformationComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(DialogModalInformationComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
