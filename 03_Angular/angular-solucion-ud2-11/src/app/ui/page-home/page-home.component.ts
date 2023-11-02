import { Component } from '@angular/core';
import { NgbModal } from '@ng-bootstrap/ng-bootstrap';
import { MovieDetailResponse } from 'src/app/models/movie-detail.interface';
import { MoviePopular } from 'src/app/models/movie-popular.interface';
import { MovieTopRated } from 'src/app/models/movie-top-rated.interface';
import { MovieService } from 'src/app/services/movie.service';

@Component({
  selector: 'app-page-home',
  templateUrl: './page-home.component.html',
  styleUrls: ['./page-home.component.css']
})
export class PageHomeComponent {

  movieSelected: MovieDetailResponse | undefined;
  constructor(private modal: NgbModal, private movieService: MovieService) { }

  onMoviePopularClick(movieId: number, modalToOpen: any) {
    this.movieService.getMovie(movieId).subscribe(resp => {
      this.movieSelected = resp;
      this.modal.open(modalToOpen);
    });
  }

}
