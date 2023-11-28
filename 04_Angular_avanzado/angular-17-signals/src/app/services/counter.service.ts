import { Injectable, signal } from '@angular/core';

@Injectable({
  providedIn: 'root',
})
export class CounterService {
  contador = signal(0);

  constructor() {}

  increment() {
    // this.contador.set(this.contador() + 1);
    this.contador.update((prev) => prev + 1);
  }

  getCount() {
    return this.contador();
  }
}
