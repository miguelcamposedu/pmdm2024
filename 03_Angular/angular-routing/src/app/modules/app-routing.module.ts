import { NgModule } from '@angular/core';
import { Route, RouterModule, Routes } from '@angular/router';
import { FirstComponent } from '../components/first/first.component';
import { SecondComponent } from '../components/second/second.component';
import { PageNotFoundComponent } from '../components/page-not-found/page-not-found.component';

const routes: Routes = [
  { path: 'first', component: FirstComponent },
  { path: 'second', component: SecondComponent },
  { path: 'detail', component: FirstComponent },
  { path: '', pathMatch: 'full', redirectTo: '/first' },
  { path: '**', component: PageNotFoundComponent },
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
