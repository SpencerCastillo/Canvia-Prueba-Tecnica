import { Component, Inject } from '@angular/core';
import { MatDialog, MatDialogRef,MAT_DIALOG_DATA } from '@angular/material/dialog';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { ClienteService } from 'src/app/services/cliente.service';
import { Cliente } from 'src/app/models/cliente';
import { DialogModalInformationComponent } from 'src/app/app-dialog-modal/dialog-modal-information/dialog-modal-information.component';

export interface DialogData{
  Id:number;
}

@Component({
  selector: 'app-modal-create-edit-cliente',
  templateUrl: './modal-create-edit-cliente.component.html',
  styleUrls: ['./modal-create-edit-cliente.component.css']
})
export class ModalCreateEditClienteComponent  {

  TituloModal:string = 'Nuevo Cliente';
  ownerForm!:FormGroup;
  cliente: Cliente = new Cliente();
  TipoPersona:string = '';
  disabledTipoPersona:boolean = false;
  constructor(public dialogRef: MatDialogRef<ModalCreateEditClienteComponent>,
    @Inject(MAT_DIALOG_DATA) public data: DialogData,public dialog: MatDialog,
    private clienteService:ClienteService) { 

      this.cliente.inIdCliente = this.data.Id;
      if(this.cliente.inIdCliente != 0){
        this.TituloModal = 'Modificar Cliente';
        this.disabledTipoPersona = true;
        this.clienteService.getClienteById(this.cliente.inIdCliente).subscribe(data => {
          this.TipoPersona = data.Cliente.chTipoPersona;
          this.updateValueAndValidity();
          this.ownerForm.get('chTipoPersona')?.setValue(data.Cliente.chTipoPersona);
          this.ownerForm.get('vcNumeroDocumento')?.setValue(data.Cliente.vcNumeroDocumento);
          this.ownerForm.get('nvApellidoPaterno')?.setValue(data.Cliente.nvApellidoPaterno);
          this.ownerForm.get('nvApellidoMaterno')?.setValue(data.Cliente.nvApellidoMaterno);
          this.ownerForm.get('nvNombres')?.setValue(data.Cliente.nvNombres);
          this.ownerForm.get('vcRazonSocial')?.setValue(data.Cliente.vcRazonSocial);
          this.ownerForm.get('vcEmail')?.setValue(data.Cliente.vcEmail);
          this.ownerForm.get('vcDireccion')?.setValue(data.Cliente.vcDireccion);
          this.ownerForm.get('chSexo')?.setValue(data.Cliente.chSexo);

        });

      }


      this.ownerForm = new FormGroup({
        chTipoPersona: new FormControl('',Validators.required),
        vcNumeroDocumento:new FormControl('',Validators.required),
        nvApellidoPaterno:new FormControl('',Validators.required),
        nvApellidoMaterno:new FormControl('',Validators.nullValidator),
        nvNombres:new FormControl('',Validators.required),
        vcRazonSocial: new FormControl('',Validators.nullValidator),
        vcEmail:new FormControl('',[Validators.email]),
        vcDireccion:new FormControl('',Validators.required),
        chSexo:new FormControl('',Validators.required),
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
      this.cliente.chTipoPersona = this.ownerForm.get('chTipoPersona')?.value;
      this.cliente.vcNumeroDocumento = this.ownerForm.get('vcNumeroDocumento')?.value;
      this.cliente.nvApellidoPaterno = this.ownerForm.get('nvApellidoPaterno')?.value;
      this.cliente.nvApellidoMaterno = this.ownerForm.get('nvApellidoMaterno')?.value;
      this.cliente.nvNombres = this.ownerForm.get('nvNombres')?.value;
      this.cliente.vcDireccion = this.ownerForm.get('vcDireccion')?.value;
      this.cliente.vcRazonSocial = this.ownerForm.get('vcRazonSocial')?.value;
      this.cliente.vcEmail = this.ownerForm.get('vcEmail')?.value;
      this.cliente.chSexo = this.ownerForm.get('chSexo')?.value;
      this.clienteService.createUpdate({Cliente:this.cliente}).subscribe(data => {

        this.dialogRef.close();
        this.dialog
            .open(DialogModalInformationComponent, {
              width: '400px',
              data: {message:data.vcMensaje}
            });
      


      });
     

    }
  }


  onChangeTipoPersona(){
    
    this.TipoPersona = this.ownerForm.get('chTipoPersona')?.value;
    this.retearCampos();
    this.updateValueAndValidity();
  }

  retearCampos(){
    this.ownerForm.get('nvApellidoPaterno')?.setValue('');
    this.ownerForm.get('nvApellidoMaterno')?.setValue('');
    this.ownerForm.get('nvNombres')?.setValue('');
    this.ownerForm.get('vcRazonSocial')?.setValue('');
    this.ownerForm.get('vcEmail')?.setValue('');
    this.ownerForm.get('vcDireccion')?.setValue('');
    this.ownerForm.get('chSexo')?.setValue('');
  }

  updateValueAndValidity(){
    if(this.TipoPersona == 'N'){
      
      this.ownerForm.get('nvApellidoPaterno')?.setValidators([Validators.required]);
      this.ownerForm.get('nvNombres')?.setValidators([Validators.required]);
      this.ownerForm.get('chSexo')?.setValidators([Validators.required]);
      this.ownerForm.get('nvNombres')?.updateValueAndValidity();
      this.ownerForm.get('nvNombres')?.updateValueAndValidity();
      this.ownerForm.get('chSexo')?.updateValueAndValidity();

      this.ownerForm.get('vcRazonSocial')?.setValidators([Validators.nullValidator]);
      this.ownerForm.get('vcRazonSocial')?.updateValueAndValidity();

 
      
      

    }else{
      this.ownerForm.get('vcRazonSocial')?.setValidators([Validators.required]);
      this.ownerForm.get('vcRazonSocial')?.updateValueAndValidity();

      this.ownerForm.get('nvApellidoPaterno')?.setValidators([Validators.nullValidator]);
      this.ownerForm.get('nvNombres')?.setValidators([Validators.nullValidator]);
      this.ownerForm.get('chSexo')?.setValidators([Validators.nullValidator]);
      this.ownerForm.get('nvApellidoPaterno')?.updateValueAndValidity();
      this.ownerForm.get('nvNombres')?.updateValueAndValidity();
      this.ownerForm.get('chSexo')?.updateValueAndValidity();
    }
  }

  

}
