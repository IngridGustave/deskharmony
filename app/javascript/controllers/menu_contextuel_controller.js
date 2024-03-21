import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="menu-contextuel"
export default class extends Controller {


  connect() {
  }

  display(e) {

    let div = document.createElement('div');
    div.innerText = "jjsjlqkjlqk"
    div.classList.add('menu-context');
    e.target.appendChild(div);

  }
}
