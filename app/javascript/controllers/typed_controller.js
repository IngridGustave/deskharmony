import { Controller } from "@hotwired/stimulus"
import Typed from 'typed.js';

// Connects to data-controller="typed"
export default class extends Controller {

  static targets = ["book1", "book2", "book3", "book4"]
  connect() {
    console.log("connect");
    var typed = new Typed(this.book1Target, {
      // Placez vos options ici
      strings: ["Pierrot", "Votre réservation a été confirmée"],
      typeSpeed: 30,
      loop: true
    });
    var typed = new Typed(this.book2Target, {
      // Placez vos options ici
      strings: ["Ruth", "Vous avez reçu un message"],
      typeSpeed: 30,
      loop: true
    });
    var typed = new Typed(this.book3Target, {
      // Placez vos options ici
      strings: ["Huguette", "Votre bureau a été réservée"],
      typeSpeed: 30,
      loop: true
    });
    var typed = new Typed(this.book4Target, {
      // Placez vos options ici
      strings: ["Paulette", "Votre réservation a été annulée"],
      typeSpeed: 30,
      loop: true
    });
  }


}
