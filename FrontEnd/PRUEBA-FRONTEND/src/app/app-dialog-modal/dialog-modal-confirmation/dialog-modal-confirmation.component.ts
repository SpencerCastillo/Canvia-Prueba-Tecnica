import { Component, Inject } from '@angular/core';
import {MatDialog, MatDialogRef, MAT_DIALOG_DATA} from '@angular/material/dialog';
export interface DialogData {
  animal: string;
  name: string;
}
@Component({
  selector: 'app-dialog-modal-confirmation',
  templateUrl: './dialog-modal-confirmation.component.html',
  styleUrls: ['./dialog-modal-confirmation.component.css']
})
export class DialogModalConfirmationComponent  {

  constructor(public dialogRef: MatDialogRef<DialogModalConfirmationComponent>,
    @Inject(MAT_DIALOG_DATA) public data: DialogData) { }

    onNoClick(): void {
      this.dialogRef.close(false);
    }
    onSiConfirm(): void {
      this.dialogRef.close(true);
    }

}
