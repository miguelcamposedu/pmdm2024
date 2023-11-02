import { Component, EventEmitter, Input, Output } from '@angular/core';
import { MoviePopular } from 'src/app/models/movie-popular.interface';
import { MovieTopRated } from 'src/app/models/movie-top-rated.interface';

@Component({
  selector: 'app-movie-item',
  templateUrl: './movie-item.component.html',
  styleUrls: ['./movie-item.component.css']
})
export class MovieItemComponent {
  @Input() movie: MoviePopular | MovieTopRated | undefined;
  @Output() movieClick = new EventEmitter<number>();

  detailClick() {
    this.movieClick.emit(this.movie?.id);
  }
}
