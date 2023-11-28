import { Component, signal } from '@angular/core';
import { CounterService } from '../../services/counter.service';

@Component({
  selector: 'app-b',
  templateUrl: './b.component.html',
  styleUrl: './b.component.css',
})
export class BComponent {
  contador = signal(0);

  constructor(private countService: CounterService) {}

  increment() {
    this.countService.increment();
  }
}
