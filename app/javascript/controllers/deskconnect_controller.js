import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="deskconnect"
export default class extends Controller {
  static targets = ['link', "modal"]
  connect() {
    const url = "/desks";

    // demande des infos des bureaux aux Desks_controller#index en Json
    fetch(url, {
      headers: { "Accept": "application/json" },
    })
      .then(response => response.json())
      .then((data) => {

        // récupération des bureaux de l'étage issue de l'HTML
        const desks_drawing = Array.from(this.linkTarget.querySelectorAll('rect[data-bureau]'));
        desks_drawing.forEach((desk_drawing) => {
          data.forEach((desk) => {
            if (desk.name === desk_drawing.dataset.bureau) {
              if (desk.dispo) {
                desk_drawing.style.fill = "green"
              } else {
                desk_drawing.style.fill = "red"
              }
            }

          })
        })

      })

  }

  form(e) {
    this.modalTarget.style.display = "block"
    console.log(e);


  }

  book() {

  }


}
