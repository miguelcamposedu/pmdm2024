import { Component, OnInit } from '@angular/core';
import { PeopleListResponse, Person } from 'src/app/models/people-list.interface';
import { PeopleService } from 'src/app/services/people.service';

@Component({
  selector: 'app-people-list',
  templateUrl: './people-list.component.html',
  styleUrls: ['./people-list.component.css']
})
export class PeopleListComponent implements OnInit {
  peopleList: Person[] = [];

  constructor(private peopleService: PeopleService) { }

  ngOnInit(): void {
    this.peopleService.getPeopleList().subscribe(resp => {
      this.peopleList = resp.results;
    });
  }


}
