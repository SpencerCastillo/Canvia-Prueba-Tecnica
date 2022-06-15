import { Injectable } from '@angular/core';
import { HttpClient,HttpHeaders, HttpClientModule} from '@angular/common/http';
import { Observable, throwError } from 'rxjs';
import { retry, catchError } from 'rxjs/operators';
import { environment } from 'src/environments/environment';
import { Cliente, FilterCliente } from '../models/cliente';

@Injectable({
    providedIn: 'root'
  })
  export class ClienteService {
  
    
    httpOptions = {
        headers: new HttpHeaders({
          'Content-Type': 'application/json'
        })
      }
  
    constructor(private http:HttpClient) {
  
        
    }

     getList(filter:FilterCliente):Observable<any>{
  
      return this.http.post<any>(environment.URL_BASE+ 
        'Cliente/ListarCliente/',filter);
      
     }


      createUpdate(parametros:any){
        return this.http.post<any>(environment.URL_BASE + 
            'Cliente/CreateUpdate',parametros);
      }

     

      
      AnularById(parametros:any){
        return this.http.put<any>(environment.URL_BASE + 'Cliente/AnularCliente/',parametros);
      }

      EliminarById(inIdCliente:number){
        return this.http.delete<any>(environment.URL_BASE + 'Cliente/EliminarCliente/?inIdCliente='+inIdCliente+'&inCodUsuario_Aud=0');
      }

     
      getClienteById(inIdCliente:  number ):Observable<any>{

        return this.http.get<any>( environment.URL_BASE+ 'Cliente/ObtenerClientePorId?inIdCliente='+inIdCliente+'&inCodUsuario_Aud=0')
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