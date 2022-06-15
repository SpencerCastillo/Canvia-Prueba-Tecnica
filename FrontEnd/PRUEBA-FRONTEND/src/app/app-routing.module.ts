import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { AppComponent } from './app.component';
import { ClienteComponent } from './components/cliente/cliente.component';

import { ItemComponent } from './components/item/item.component';

const routes: Routes = [
  {
    path:'clientes',
    component:ClienteComponent
  },
  {
    path:'items',
    component:ItemComponent
  }

    
];

@NgModule({
  imports: [RouterModule.forRoot(routes, { useHash: true })],
  exports: [RouterModule]
})
export class AppRoutingModule { }
