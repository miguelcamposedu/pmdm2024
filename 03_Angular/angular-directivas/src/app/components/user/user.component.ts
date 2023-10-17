import { Component } from '@angular/core';

@Component({
  selector: 'app-user',
  templateUrl: './user.component.html',
  styleUrls: ['./user.component.css']
})
export class UserComponent {
  nombre = 'Miguel';
  edad = 20;
  apellidos = 'Campos Rivera';
  sexo = 'h';

  isMenorEdad() {
    return this.edad < 18;
  }


}
