import { Component, Optional } from '@angular/core';
import {
  Auth,
  GoogleAuthProvider,
  User,
  authState,
  signInAnonymously,
  signInWithPopup,
  signOut,
} from '@angular/fire/auth';
import { map } from 'rxjs';
import { Observable } from 'rxjs/internal/Observable';
import { Subscription } from 'rxjs/internal/Subscription';
import { EMPTY } from 'rxjs/internal/observable/empty';
import { traceUntilFirst } from '@angular/fire/performance';

@Component({
  selector: 'app-google-login',
  templateUrl: './google-login.component.html',
  styleUrl: './google-login.component.css',
})
export class GoogleLoginComponent {
  private readonly userDisposable: Subscription | undefined;
  public readonly user: Observable<User | null> = EMPTY;

  showLoginButton = false;
  showLogoutButton = false;

  constructor(@Optional() private auth: Auth) {
    if (auth) {
      this.user = authState(this.auth);
      this.userDisposable = authState(this.auth)
        .pipe(
          traceUntilFirst('auth'),
          map((u) => !!u)
        )
        .subscribe((isLoggedIn) => {
          debugger;
          this.showLoginButton = !isLoggedIn;
          this.showLogoutButton = isLoggedIn;
        });
    }
  }

  ngOnInit(): void {}

  ngOnDestroy(): void {
    if (this.userDisposable) {
      this.userDisposable.unsubscribe();
    }
  }

  async login() {
    return await signInWithPopup(this.auth, new GoogleAuthProvider());
  }

  async loginAnonymously() {
    return await signInAnonymously(this.auth);
  }

  async logout() {
    return await signOut(this.auth);
  }
}
