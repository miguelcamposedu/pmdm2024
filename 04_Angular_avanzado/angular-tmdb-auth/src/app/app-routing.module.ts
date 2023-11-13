import { NgModule } from '@angular/core';
import { RouterModule, Routes } from '@angular/router';
import { PageHomeComponent } from './ui/page-home/page-home.component';
import { AuthApprovedComponent } from './components/auth-approved/auth-approved.component';

const routes: Routes = [
  { path: 'home', component: PageHomeComponent},
  { path: 'approved', component: AuthApprovedComponent },
  { path: '', redirectTo: '/home', pathMatch: 'full' },
  { path: '**', component: PageHomeComponent }
];

@NgModule({
  imports: [RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
