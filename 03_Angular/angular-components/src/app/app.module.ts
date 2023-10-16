import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';

import { NgbModule } from '@ng-bootstrap/ng-bootstrap';
import { AppComponent } from './app.component';
import { HomeScreenComponent } from './ui/home-screen/home-screen.component';
import { ChartComponent } from './components/chart/chart.component';
import { UserListComponent } from './components/user-list/user-list.component';
import { UserListScreenComponent } from './ui/user-list-screen/user-list-screen.component';
import { UserMonthTopComponent } from './components/user-month-top/user-month-top.component';
import { CalculatorComponent } from './components/calculator/calculator.component';
import { FormsModule } from '@angular/forms';

@NgModule({
  declarations: [
    AppComponent,
    HomeScreenComponent,
    ChartComponent,
    UserListComponent,
    UserListScreenComponent,
    UserMonthTopComponent,
    CalculatorComponent
  ],
  imports: [
    BrowserModule,
    NgbModule,
    FormsModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
