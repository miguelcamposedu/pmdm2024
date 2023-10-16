import { Component } from '@angular/core';

@Component({
  selector: 'app-calculator',
  templateUrl: './calculator.component.html',
  styleUrls: ['./calculator.component.css']
})
export class CalculatorComponent {
  a = 5;
  b= 10;
  result = 0;
  getSum() {
    this.result = this.a+this.b;
  }
}
