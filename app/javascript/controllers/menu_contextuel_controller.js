import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="menu-contextuel"
export default class extends Controller {


  connect() {

  }

  display(e) {
    const template = document.querySelector("#subMenuTemplatee");

    if (!e.target.classList.contains("menu-context")) {
      let div = document.createElement('div');
      let btnShow = document.createElement('a');
      btnShow.innerText = "Bureau"
      div.classList.add('menu-context');
      e.target.appendChild(div);
    }
  }



}
