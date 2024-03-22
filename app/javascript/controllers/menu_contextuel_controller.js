import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="menu-contextuel"
export default class extends Controller {


  connect() {

  }

  _availableDesk(data, e) {
    if (!e.target.classList.contains("menu-context")) {
      let div = document.createElement('div');
      div.classList.add('menu-context');
      e.target.appendChild(div);
      div.innerHTML = data;
    }

  }

  display(e) {
    console.log("bureau menu")
    if (e.target.classList.contains("svginsertion")) {
      const foreignObjects = document.querySelectorAll("foreignObject");
      foreignObjects.forEach((foreignObject) => {
        foreignObject.style.display = "none";
      })
      e.target.parentNode.style.display = "block";
      const nameDesk = e.target.dataset.bureau;
      const url = `/desks/available?bureau=${nameDesk}`;
      fetch(url, {
        method: "GET",
        headers: { "Accept": "text/plain" },
      })
        .then(response => response.text())
        .then((data) => {
          this._availableDesk(data, e)
        })
    }
  }

  remove(e) {
    e.target.parentNode.parentNode.remove();
    const foreignObjects = document.querySelectorAll("foreignObject");
    foreignObjects.forEach((foreignObject) => {
      foreignObject.style.display = "block";
    })
  }
}
