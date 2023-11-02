import { Component, EventEmitter, OnInit, Output } from '@angular/core';
import { MoviePopular } from 'src/app/models/movie-popular.interface';
import { MovieService } from 'src/app/services/movie.service';

@Component({
  selector: 'app-movie-popular-list',
  templateUrl: './movie-popular-list.component.html',
  styleUrls: ['./movie-popular-list.component.css']
})
export class MoviePopularListComponent implements OnInit {
  @Output() onMovieDetailClick = new EventEmitter<number>();
  movieList: MoviePopular[] = [];

  constructor(private movieService: MovieService) { }

  ngOnInit(): void {
    this.movieService.getPopular().subscribe(resp => {
      this.movieList = resp.results;
    });
  }

  onMovieClick(movieId: number) {
    this.onMovieDetailClick.emit(movieId);
  }
}
