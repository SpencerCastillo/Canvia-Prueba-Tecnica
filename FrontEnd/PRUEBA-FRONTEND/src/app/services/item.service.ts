import { Injectable } from '@angular/core';
import { HttpClient,HttpHeaders, HttpClientModule} from '@angular/common/http';
import { Observable, throwError } from 'rxjs';
import { retry, catchError } from 'rxjs/operators';
import { environment } from 'src/environments/environment';
import { FilterItem } from '../models/item';


@Injectable({
    providedIn: 'root'
  })
  export class ItemService {
  
    
    httpOptions = {
        headers: new HttpHeaders({
          'Content-Type': 'application/json'
        })
      }
  
    constructor(private http:HttpClient) {
  
        
    }

     getList(filter:FilterItem):Observable<any>{
  
      return this.http.post<any>(environment.URL_BASE+ 
        'Item/ListarItem/',filter);
      
     }


      createUpdate(parametros:any){
        return this.http.post<any>(environment.URL_BASE + 
            'Item/CreateUpdate',parametros);
      }

     

      
      AnularById(parametros:any){
        return this.http.put<any>(environment.URL_BASE + 'Item/AnularItem/',parametros);
      }

      EliminarById(inIdItem:number){
        return this.http.delete<any>(environment.URL_BASE + 'Item/EliminarItem/?inIdItem='+inIdItem+'&inCodUsuario_Aud=0');
      }

     
      getItemById(inIdItem:  number ):Observable<any>{

        return this.http.get<any>( environment.URL_BASE+ 'Item/ObtenerItemPorId?inIdItem='+inIdItem+'&inCodUsuario_Aud=0')
          .pipe(
            retry(1),
            catchError(this.errorHandl)
          )
  
       }

     errorHandl(error:any) {
      let errorMessage = '';
      if(error.error instanceof ErrorEvent) {
        // Get client-side error
        errorMessage = error.error.message;
      } else {
        // Get server-side error
        errorMessage = `Error Code: ${error.status}\nMessage: ${error.message}`;
      }
      console.log(errorMessage);
      return throwError(errorMessage);
  }
     





}