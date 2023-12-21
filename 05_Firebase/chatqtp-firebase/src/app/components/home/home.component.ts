import { Component, OnInit } from '@angular/core';
import { GameService } from '../../services/game.service';
import { onSnapshot } from '@angular/fire/firestore';

@Component({
  selector: 'app-home',
  templateUrl: './home.component.html',
  styleUrl: './home.component.css',
})
export class HomeComponent implements OnInit {
  constructor(private gameService: GameService) {}

  ngOnInit(): void {
    const query = this.gameService.getEmptyGame();
    const unsubscribe = onSnapshot(query, (querySnapshot) => {
      const games: string[] = [];
      querySnapshot.forEach((doc) => {
        games.push(doc.id);
      });

      if (games.length === 0) {
        console.log('No games found');
      } else {
        console.log('Game found: ', games.join(', '));
        // router.navigate(['game', games[0]]);
      }
    });
  }
}
