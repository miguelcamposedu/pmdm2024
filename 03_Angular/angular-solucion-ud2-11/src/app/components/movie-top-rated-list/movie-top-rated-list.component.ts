import { Component } from '@angular/core';
import { MovieTopRated } from 'src/app/models/movie-top-rated.interface';
import { MovieService } from 'src/app/services/movie.service';

@Component({
  selector: 'app-movie-top-rated-list',
  templateUrl: './movie-top-rated-list.component.html',
  styleUrls: ['./movie-top-rated-list.component.css']
})
export class MovieTopRatedListComponent {
  movieList: MovieTopRated[] = [];

  constructor(private movieService: MovieService) { }

  ngOnInit(): void {
    this.movieService.getPopular().subscribe(resp => {
      this.movieList = resp.results;
    });
  }
}
