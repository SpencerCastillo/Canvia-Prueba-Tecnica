import { Component, Inject } from '@angular/core';
import {MatDialog, MatDialogRef, MAT_DIALOG_DATA} from '@angular/material/dialog';



export class DialogData {
  message:string = '';
  titleMessage:string = '';
}


@Component({
  selector: 'app-dialog-modal-information',
  templateUrl: './dialog-modal-information.component.html',
  styleUrls: ['./dialog-modal-information.component.css']
})
export class DialogModalInformationComponent {



  constructor(public dialogRef: MatDialogRef<DialogModalInformationComponent>,
    @Inject(MAT_DIALOG_DATA) public data: DialogData) { 

     
     
    }

    onNoClick(): void {
      this.dialogRef.close(false);
    }

  

}
