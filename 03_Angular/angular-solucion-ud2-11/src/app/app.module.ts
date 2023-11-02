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
    HttpClientModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
