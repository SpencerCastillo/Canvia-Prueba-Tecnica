import { Component, Inject } from '@angular/core';

import { MatDialog, MatDialogRef,MAT_DIALOG_DATA } from '@angular/material/dialog';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { ItemService } from 'src/app/services/item.service';
import { Item } from 'src/app/models/item';
import { DialogModalInformationComponent } from 'src/app/app-dialog-modal/dialog-modal-information/dialog-modal-information.component';
export interface DialogData{
  Id:number;
}
@Component({
  selector: 'app-modal-create-edit-item',
  templateUrl: './modal-create-edit-item.component.html',
  styleUrls: ['./modal-create-edit-item.component.css']
})
export class ModalCreateEditItemComponent {


  TituloModal:string = 'Nuevo Item';
  ownerForm!:FormGroup;
  item: Item = new Item();


  constructor(public dialogRef: MatDialogRef<ModalCreateEditItemComponent>,
    @Inject(MAT_DIALOG_DATA) public data: DialogData,public dialog: MatDialog,
    private itemService:ItemService) {

      this.item.inIdItem = this.data.Id;
      if(this.item.inIdItem != 0){
        this.TituloModal = 'Modificar Cliente';

        this.itemService.getItemById(this.item.inIdItem).subscribe(data => {
      
         
          this.ownerForm.get('vcDescripcionItem')?.setValue(data.Item.vcDescripcionItem);
          this.ownerForm.get('dePrecio')?.setValue(data.Item.dePrecio);
          this.ownerForm.get('inStockMinimo')?.setValue(data.Item.inStockMinimo);
          

        });

      }

      this.ownerForm = new FormGroup({
        vcDescripcionItem : new FormControl('',Validators.required),
        dePrecio : new FormControl('',Validators.required),
        inStockMinimo : new FormControl('',Validators.required),
      });

  }

  public hasError = (controlName: string, errorName: string) =>{
    return this.ownerForm.controls[controlName].hasError(errorName);
  }

  onNoClick(): void {
    this.dialogRef.close(false);
  }
  

  onSave(){
    if(this.ownerForm.valid){
      this.item.vcDescripcionItem = this.ownerForm.get('vcDescripcionItem')?.value;
      this.item.dePrecio = this.ownerForm.get('dePrecio')?.value;
      this.item.inStockMinimo = this.ownerForm.get('inStockMinimo')?.value;
     
      this.itemService.createUpdate({Item:this.item}).subscribe(data => {

        this.dialogRef.close();
        this.dialog
            .open(DialogModalInformationComponent, {
              width: '400px',
              data: {message:data.vcMensaje}
            });
      


      });
     

    }
  }

}
