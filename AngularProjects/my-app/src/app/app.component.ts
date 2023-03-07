import { Component } from '@angular/core';

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css'],
})
export class AppComponent {
  title = 'my-app';
  memberName = 'Navin';
  language:string = "Telegu";
  listOfLanguages:string[] = ["English","Hindi","Spanish"]

  addLanguage() {
    this.listOfLanguages.push(this.language);
    console.log(this.listOfLanguages);
  }

  deleteFirst(){
    this.listOfLanguages.splice(0,1);
  }
}
