import { Component, OnInit } from '@angular/core';
import { Character } from 'src/app/models/character-list.interface';
import { CharactersService } from 'src/app/services/characters.service';

@Component({
  selector: 'app-character-list',
  templateUrl: './character-list.component.html',
  styleUrls: ['./character-list.component.css']
})
export class CharacterListComponent implements OnInit {

  characterList: Character[] = [];
  currentPage = 1;
  numPages: number[] = [];
  constructor(private characterService: CharactersService) { }

  ngOnInit(): void {
    this.loadCharactersPage();
  }

  onPageClick(pageToLoad: number) {
    this.currentPage = pageToLoad;
    this.loadCharactersPage();
  }

  loadCharactersPage() {
    this.characterService.getAllCharacters(this.currentPage).subscribe(resp => {
      this.characterList = resp.results;
      this.numPages = [];
      for (let i = 1; i <= resp.info.pages; i++) {
        this.numPages.push(i);
      }
    });
  }

  showPreviousButton(): any {
    return this.currentPage != 1;
  }

  showNextButton(): any {
    return this.currentPage != this.numPages.length;
  }

}
