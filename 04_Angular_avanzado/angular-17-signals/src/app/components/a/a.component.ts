import {
  ChangeDetectionStrategy,
  Component,
  OnChanges,
  OnInit,
  SimpleChanges,
  effect,
  signal,
} from '@angular/core';
import { CounterService } from '../../services/counter.service';

@Component({
  selector: 'app-a',
  templateUrl: './a.component.html',
  styleUrl: './a.component.css',
})
export class AComponent {
  readonly contadorActual = this.counterService.contador.asReadonly();

  constructor(private counterService: CounterService) {}
}
