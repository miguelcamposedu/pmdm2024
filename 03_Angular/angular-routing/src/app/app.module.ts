import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';

import { AppComponent } from './app.component';
import { NgbModule } from '@ng-bootstrap/ng-bootstrap';
import { FirstComponent } from './components/first/first.component';
import { SecondComponent } from './components/second/second.component';
import { AppRoutingModule } from './modules/app-routing.module';
import { PageNotFoundComponent } from './components/page-not-found/page-not-found.component';

@NgModule({
  declarations: [
    AppComponent,
    FirstComponent,
    SecondComponent,
    PageNotFoundComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    NgbModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
