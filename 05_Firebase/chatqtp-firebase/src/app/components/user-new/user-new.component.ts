import { Component } from '@angular/core';
import { UserService } from '../../services/user.service';

@Component({
  selector: 'app-user-new',
  templateUrl: './user-new.component.html',
  styleUrl: './user-new.component.css',
})
export class UserNewComponent {
  name: string = '';
  age: number = 0;

  constructor(public userService: UserService) {}

  addUser() {
    this.userService.createUser(this.name, this.age);
  }
}
