
export class Cliente{
  inIdCliente:number = 0;
  chTipoPersona:string = '';
  vcNumeroDocumento:string = '';
  nvApellidoPaterno:string = '';
  nvApellidoMaterno:string = '';
  nvNombres:string = '';
  vcRazonSocial:string= '';
  vcDireccion:string = '';
  vcEmail:string = '';
  chSexo:string = '';

  inRowCount:number = 0;
  inRowIndex:number = 0;
    
}

export class DataCliente {
    Items: Cliente[] = [];
    TotalCount: number = 0;
}

export class FilterCliente{
  vcNumeroDocumento:string = '';
  nvNombres:string = '';
  vcEstado:string = '';
  pageIndex:number = 0;
  pageSize:number = 0;
  inCodUsuario_Aud:number = 0;
  biNoEliminadoLogicoBD:boolean = true;


}