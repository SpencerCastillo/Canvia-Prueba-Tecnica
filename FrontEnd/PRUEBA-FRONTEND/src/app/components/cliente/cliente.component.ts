import { Component, OnInit,ViewChild } from '@angular/core';
import { MatPaginator } from '@angular/material/paginator';
import { MatSort } from '@angular/material/sort';
import { FilterCliente } from 'src/app/models/cliente';
import { ClienteService } from 'src/app/services/cliente.service';
import {merge, Observable, of ,BehaviorSubject} from 'rxjs';
import {catchError, map, startWith, switchMap, finalize,} from 'rxjs/operators';
import { CollectionViewer } from '@angular/cdk/collections';
import { DataSource } from '@angular/cdk/table';
import { ModalCreateEditClienteComponent } from './modal-create-edit-cliente/modal-create-edit-cliente.component';
import { MatDialog } from '@angular/material/dialog';
import { DialogModalConfirmationComponent } from 'src/app/app-dialog-modal/dialog-modal-confirmation/dialog-modal-confirmation.component';
import { DialogModalInformationComponent } from 'src/app/app-dialog-modal/dialog-modal-information/dialog-modal-information.component';
@Component({
  selector: 'app-cliente',
  templateUrl: './cliente.component.html',
  styleUrls: ['./cliente.component.css']
})
export class ClienteComponent implements OnInit {

  displayedColumns: string[] = ['inRowIndex','chTipoPersona','vcNumeroDocumento', 'Cliente','vcDireccion','vcEmail','Acciones'];

  dataSource!: any; 
  resultsLength = 0;

  filter:FilterCliente = new FilterCliente();


  @ViewChild("paginator", { static: true }) paginator!: MatPaginator;
  @ViewChild(MatSort, {static: true}) sort!: MatSort;
  
  constructor(private clienteService:ClienteService,public dialog: MatDialog) { 

    this.filter.pageIndex = 0;
    this.filter.pageSize = 10;



  }

  ngOnInit(): void {
    //this.loadData();
  }

  ngAfterViewInit() {  
    this.sort.sortChange.subscribe(() => this.paginator.pageIndex = 0);
    this.loadData();
  }

  

  loadData(){
    
    merge(this.sort.sortChange, this.paginator.page)
    .pipe(
      startWith({}),
      switchMap(() => {
       // this.isLoadingResults = true;
        this.filter.pageIndex = this.paginator.pageIndex;
        return this.clienteService.getList(this.filter);
      }),
      map(data => {
        // Flip flag to show that loading has finished.
      //  this.isLoadingResults = false;
      //  this.isRateLimitReached = false;
        this.resultsLength = data.Clientes[0].inRowCount;

        return data;
      }),
      catchError(() => {
    //    this.isLoadingResults = false;
        // Catch if the GitHub API has reached its rate limit. Return empty data.
    //    this.isRateLimitReached = true;
        return of([]);
      })
    ).subscribe(data => 
      this.dataSource = data.Clientes
      );
  }

  onSearch(){
    this.loadData();
  }

  onShowAll(){
    this.filter.vcNumeroDocumento = '';
    this.filter.nvNombres = '';
    this.loadData();
  }

  onCreate(){
    const dialogRef = this.dialog.open(ModalCreateEditClienteComponent, {
      width: '800px',
     // height: '800px',
      data: {Id:0}
      });

      dialogRef.afterClosed().subscribe(result => {
        this.loadData();
        
      });
  }
  onEdit(inIdCliente:number){
    const dialogRef = this.dialog.open(ModalCreateEditClienteComponent, {
      width: '800px',
     // height: '800px',
      data: {Id:inIdCliente}
      });

      dialogRef.afterClosed().subscribe(result => {
        this.loadData();
        
      });
  }

  onAnular(cliente:any){

    let texto = cliente.biNoEliminadoLogicoBD?'anular':'activar';

    

    this.dialog
    .open(DialogModalConfirmationComponent, {
      width: '400px',
      data: '¿Desea '+texto+' el registro?'
    })
    .afterClosed().subscribe((onSiConfirm: Boolean) => {
      
      if (onSiConfirm) {

        cliente.biNoEliminadoLogicoBD = cliente.biNoEliminadoLogicoBD?false:true;
        this.clienteService.AnularById({Cliente:cliente}).subscribe(data => {
          this.dialog
          .open(DialogModalInformationComponent, {
            width: '400px',
            data: {message:data.vcMensaje}
          });
          this.loadData();
        });
      } 
    });
    
  }
  onEliminar(cliente:any){
    this.dialog
    .open(DialogModalConfirmationComponent, {
      width: '400px',
      data: `¿Desea eliminar  el registro?`
    })
    .afterClosed().subscribe((onSiConfirm: Boolean) => {
      
      if (onSiConfirm) {
  
        this.clienteService.EliminarById(cliente.inIdCliente).subscribe(data => {
          
          this.dialog
          .open(DialogModalInformationComponent, {
            width: '400px',
            data: {message:data.vcMensaje}
          });

          this.loadData();
        });
      } 
    });
  }

  MostrarInactivos:boolean = false;
  onMostrarInvactivos(){
    
    this.filter.biNoEliminadoLogicoBD = !this.MostrarInactivos;
    this.loadData();
  }
}

