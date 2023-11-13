import { Component, OnInit } from '@angular/core';
import { AccountService } from 'src/app/services/account.service';
import { AuthService } from 'src/app/services/auth.service';

@Component({
  selector: 'app-auth-approved',
  templateUrl: './auth-approved.component.html',
  styleUrls: ['./auth-approved.component.css']
})
export class AuthApprovedComponent implements OnInit {
  constructor(private authService: AuthService, private accountService: AccountService) { }

  ngOnInit(): void {
    // STEP 3: Create Session ID
    let token = localStorage.getItem('REQUEST_TOKEN');
    this.authService.createSession(token!).subscribe(resp => {
      // STEP 4: Guardamos el Session ID y solicitamos la información del usuario
      localStorage.setItem('SESSION_ID', resp.session_id);
      this.accountService.getAccountDetails().subscribe(resp => {
        console.log(resp);
      });
    });
  }
  
}
