import { Controller } from "@hotwired/stimulus"
import Typed from 'typed.js';

// Connects to data-controller="typed"
export default class extends Controller {

  static targets = ["book1", "book2", "book3", "book4"]
  connect() {
    console.log("connect");
    var typed = new Typed(this.book1Target, {
      // Placez vos options ici
      strings: ["Paul", "Pense à valider ta réservation"],
      typeSpeed: 30,
      loop: true
    });
    var typed = new Typed(this.book2Target, {
      // Placez vos options ici
      strings: ["Paulette, hier j'ai mangé une pomme!"],
      typeSpeed: 50,
      loop: true
    });
    var typed = new Typed(this.book3Target, {
      // Placez vos options ici
      strings: ["Non.. pas vrai!"],
      typeSpeed: 100,
      loop: true
    });
    var typed = new Typed(this.book4Target, {
      // Placez vos options ici
      strings: ["Ok! astronaute"],
      typeSpeed: 100,
      loop: true
    });
  }


}
