import { Component, TemplateRef } from '@angular/core';
import { NgbModal } from '@ng-bootstrap/ng-bootstrap';

@Component({
  selector: 'app-ejemplo-modal',
  templateUrl: './ejemplo-modal.component.html',
  styleUrls: ['./ejemplo-modal.component.css']
})
export class EjemploModalComponent {
  title = '';
  constructor(private modalService: NgbModal) { }

  open(modal: any) {
    this.title = 'Hola Mundo';
    this.modalService.open(modal,
      {
        keyboard: false,
        //size: 'sm',
        //backdrop: false,
        backdropClass: 'bg-warning',
        scrollable: true
      });
  }

}
