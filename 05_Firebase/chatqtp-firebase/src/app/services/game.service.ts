import { Injectable } from '@angular/core';
import {
  Firestore,
  addDoc,
  collection,
  getDocs,
  query,
  where,
  onSnapshot,
} from '@angular/fire/firestore';

const COLLECTION = 'games';

@Injectable({
  providedIn: 'root',
})
export class GameService {
  constructor(public firestore: Firestore) {}

  async createUser(name: string, age: number) {
    const docRef = await addDoc(collection(this.firestore, COLLECTION), {
      name: name,
      age: age,
    });
    console.log('Document written with ID: ', docRef.id);
  }

  getEmptyGame() {
    return query(
      collection(this.firestore, COLLECTION),
      where('player2', '==', 'null')
    );
  }
}
