import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { NgbModule } from '@ng-bootstrap/ng-bootstrap';
import { PageHomeComponent } from './ui/page-home/page-home.component';
import { MoviePopularListComponent } from './components/movie-popular-list/movie-popular-list.component';
import { MovieItemComponent } from './components/movie-item/movie-item.component';
import { MovieTopRatedListComponent } from './components/movie-top-rated-list/movie-top-rated-list.component';
import { HttpClientModule } from '@angular/common/http';
import { PageNotFoundComponent } from './ui/page-not-found/page-not-found.component';
import { NgCircleProgressModule } from 'ng-circle-progress';

@NgModule({
  declarations: [
    AppComponent,
    PageHomeComponent,
    MoviePopularListComponent,
    MovieItemComponent,
    MovieTopRatedListComponent,
    PageNotFoundComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    NgbModule,
    HttpClientModule,
    NgCircleProgressModule.forRoot({
      // set defaults here
      radius: 100,
      outerStrokeWidth: 16,
      innerStrokeWidth: 0,
      outerStrokeColor: "#78C000",
      innerStrokeColor: "#C7E596",
      backgroundColor: "#000000",
      animationDuration: 300,
    })
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
