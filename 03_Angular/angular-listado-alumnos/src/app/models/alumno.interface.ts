export enum Sex {
  Male,
  Female
}

export interface Student {
  id: string;
  name: string;
  lastname: string;
  sex: Sex;
  age: number;
  subjects: SchoolSubject[];
  paid?: boolean;
}

export interface SchoolSubject {
  name: string;
  hours: number;
}
