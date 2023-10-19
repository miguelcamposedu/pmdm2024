import { Component } from '@angular/core';
import { Sex, Student } from 'src/app/models/alumno.interface';

const TOTAL_HOURS = 50;
const STUDENTS: Student[] = [
  {
    id: '1',
    name: 'Miguel',
    lastname: 'Campos',
    sex: Sex.Female,
    age: 25,
    subjects: [
      {
        name: 'Math',
        hours: 5
      },
      {
        name: 'Spanish',
        hours: 4
      }
    ],
    paid: true
  },
  {
    id: '2',
    name: 'Pepe',
    lastname: 'García',
    sex: Sex.Female,
    age: 25,
    subjects: [
      {
        name: 'Math',
        hours: 10
      },
      {
        name: 'Spanish',
        hours: 30
      }
    ],
    paid: false
  }
];

@Component({
  selector: 'app-student-list',
  templateUrl: './student-list.component.html',
  styleUrls: ['./student-list.component.css']
})
export class StudentListComponent {
  getProgressBarClasses(student: Student) {
    let percent = this.getProgressBar(student);
    if (percent < 50) {
      return 'progress-bar progress-bar-striped bg-danger';
    } else {
      return 'progress-bar progress-bar-striped bg-success';
    }
  }

  studentList = STUDENTS;

  getPaidString(student: Student) {
    return student.paid ? 'Yes' : 'No';
  }

  getProgressBar(student: Student): number {
    let totalHoursStudent = 0;
    student.subjects.forEach(subject => {
      totalHoursStudent += subject.hours;
    });
    let percent = parseFloat((totalHoursStudent * 100 / TOTAL_HOURS).toFixed(2));
    return percent;
  }
}
