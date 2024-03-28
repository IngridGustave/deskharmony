import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="sousmenu"
export default class extends Controller {
  static targets = ["etage", "bureau"]

  connect() {
    console.log("test")
  }

  display(e) {
    e.preventDefault();
    this.etageTarget.classList.toggle("active");
  }
}
