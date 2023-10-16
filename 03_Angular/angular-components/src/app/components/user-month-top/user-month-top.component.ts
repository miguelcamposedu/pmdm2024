import { Component } from '@angular/core';

@Component({
  selector: 'app-user-month-top',
  templateUrl: './user-month-top.component.html',
  styleUrls: ['./user-month-top.component.css']
})
export class UserMonthTopComponent {
  nombre = "Juan";
  edad = 35;
  sexo = 'h';

  getSexString() {
    return this.sexo == 'h'? 'Hombre' : 'Mujer';
  }

  getSexIcon() {
    return this.sexo == 'h'? './assets/img/male.png': './assets/img/female.png';
  }
}
