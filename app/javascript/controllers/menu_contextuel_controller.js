import { Controller } from "@hotwired/stimulus"
import Swal from 'sweetalert2';
window.Swal = Swal;

// Connects to data-controller="menu-contextuel"
export default class extends Controller {


  connect() {

  }

  _availableDesk(data, e) {
    if (!e.target.classList.contains("menu-context")) {
      let div = document.createElement('div');
      div.classList.add('menu-context');
      console.log(e.target.dataset.position);
      if (e.target.dataset.position == "right") {
        div.style.top = "-30px";
      }
      if (e.target.dataset.position == "bottom") {
        div.style.bottom = "-20px";
      }
      if (e.target.dataset.position == "left") {
        div.style.right = "110px";
        div.style.left = "auto";
        div.style.top = "-40px";
      }

      e.target.appendChild(div);
      div.innerHTML = data;
    }

  }

  display(e) {
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
