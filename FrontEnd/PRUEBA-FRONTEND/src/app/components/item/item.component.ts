import { Component, OnInit,ViewChild } from '@angular/core';
import { MatPaginator } from '@angular/material/paginator';
import { MatSort } from '@angular/material/sort';
import { FilterItem } from 'src/app/models/item';
import {merge, Observable, of ,BehaviorSubject} from 'rxjs';
import {catchError, map, startWith, switchMap, finalize,} from 'rxjs/operators';
import { MatDialog } from '@angular/material/dialog';
import { ItemService } from 'src/app/services/item.service';
import { ModalCreateEditItemComponent } from './modal-create-edit-item/modal-create-edit-item.component';
import { DialogModalConfirmationComponent } from 'src/app/app-dialog-modal/dialog-modal-confirmation/dialog-modal-confirmation.component';
import { DialogModalInformationComponent } from 'src/app/app-dialog-modal/dialog-modal-information/dialog-modal-information.component';
@Component({
  selector: 'app-item',
  templateUrl: './item.component.html',
  styleUrls: ['./item.component.css']
})
export class ItemComponent implements OnInit {

  displayedColumns: string[] = ['inRowIndex','vcDescripcionItem', 'dePrecio','inStockMinimo','Acciones'];

  dataSource!: any; 
  resultsLength = 0;

  filter:FilterItem = new FilterItem();

  MostrarInactivos:boolean = false;

  @ViewChild("paginator", { static: true }) paginator!: MatPaginator;
  @ViewChild(MatSort, {static: true}) sort!: MatSort;


  constructor(private itemService:ItemService,public dialog: MatDialog) { 

    this.filter.pageIndex = 0;
    this.filter.pageSize = 10;



  }

  
  ngOnInit(): void {
   // this.loadData();
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
        return this.itemService.getList(this.filter);
      }),
      map(data => {
        // Flip flag to show that loading has finished.
      //  this.isLoadingResults = false;
      //  this.isRateLimitReached = false;
        this.resultsLength = data.Items[0].inRowCount;

        return data;
      }),
      catchError(() => {
    //    this.isLoadingResults = false;
        // Catch if the GitHub API has reached its rate limit. Return empty data.
    //    this.isRateLimitReached = true;
        return of([]);
      })
    ).subscribe(data => 
      this.dataSource = data.Items
      );
  }

  onSearch(){
    this.loadData();
  }

  onShowAll(){
    this.filter.vcDescripcionItem = '';
    this.loadData();
  }



  onMostrarInvactivos(){
    this.filter.biNoEliminadoLogicoBD = !this.MostrarInactivos;
    this.loadData();
  }

  onCreate(){
    const dialogRef = this.dialog.open(ModalCreateEditItemComponent, {
      width: '800px',
     // height: '800px',
      data: {Id:0}
      });

      dialogRef.afterClosed().subscribe(result => {
        this.loadData();
        
      });
  }

  onEdit(inIdItem: number){
    const dialogRef = this.dialog.open(ModalCreateEditItemComponent, {
      width: '800px',
     // height: '800px',
      data: {Id:inIdItem}
      });

      dialogRef.afterClosed().subscribe(result => {
        this.loadData();
        
      });
  }

  onAnular(item:any){
    let texto = item.biNoEliminadoLogicoBD?'anular':'activar';

    

    this.dialog
    .open(DialogModalConfirmationComponent, {
      width: '400px',
      data: '¿Desea '+texto+' el registro?'
    })
    .afterClosed().subscribe((onSiConfirm: Boolean) => {
      
      if (onSiConfirm) {

        item.biNoEliminadoLogicoBD = item.biNoEliminadoLogicoBD?false:true;
        this.itemService.AnularById({Item:item}).subscribe(data => {
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

  onEliminar(item:any){
    this.dialog
    .open(DialogModalConfirmationComponent, {
      width: '400px',
      data: `¿Desea eliminar  el registro?`
    })
    .afterClosed().subscribe((onSiConfirm: Boolean) => {
      
      if (onSiConfirm) {
  
        this.itemService.EliminarById(item.inIdItem).subscribe(data => {
          
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



}
