export class Item{
    inIdItem!:number;
    vcDescripcionItem!: string;
    dePrecio!:number;
    inStockMinimo!:number;
}

export class FilterItem{
    vcDescripcionItem!:string;
    biNoEliminadoLogicoBD:boolean = true;
    pageIndex!:number;
    pageSize!:number;
    inCodUsuario_Aud:number = 0;
}