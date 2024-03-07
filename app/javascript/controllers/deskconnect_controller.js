import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="deskconnect"
export default class extends Controller {
  static targets = ['link', "modal", "end_date", "start_date", "form"]

  form(e) {
    e.preventDefault();

    const url = `${this.formTarget.action}?startdate=${this.start_dateTarget.value}&enddate=${this.end_dateTarget.value}`;
    console.log(url)

    fetch(url, {
      method: "GET",
      headers: { "Accept": "application/json" },
    })
      .then(response => response.json())
      .then((data) => {
        console.log(data)
        // récupération des bureaux de l'étage issue de l'HTML
        const desks_drawing = Array.from(this.linkTarget.querySelectorAll('rect[data-bureau]'));
        desks_drawing.forEach((desk_drawing) => {
          data.forEach((desk) => {
            if (desk.name === desk_drawing.dataset.bureau) {
              if (desk.dispo) {
                desk_drawing.style.fill = "green"
                desk_drawing.dataset.startdate = desk.start_at;
                desk_drawing.dataset.enddate = desk.end_at;
              } else {
                desk_drawing.style.fill = "red"
              }
            }
          })
        })
      })
  }

  book(e) {
    e.target.classList.add('activebook');
    this.modalTarget.style.display = "block"
    const startdate = e.target.dataset.startdate;
    const enddate = e.target.dataset.enddate;

    if (startdate && enddate) {
      const inputStart = document.querySelector('.start');
      const inputEnd = document.querySelector('.end');

      inputStart.innertText = startdate;
      inputEnd.innertText = enddate

      const button = this.modalTarget.querySelector(".btn-sky");
      button.classList.remove("dis-none");
    }
  }

  submit() {
    const activebook = document.querySelector('.activebook');
    const url = "/appointments"
    console.log(activebook);
    const csrfToken = document.querySelector('meta[name="csrf-token"]').getAttribute('content');
    console.log(csrfToken);
    const requestData = {
      appointment: {
        startdate: activebook.dataset.startdate,
        enddate: activebook.dataset.enddate,
        desk: activebook.dataset.bureau
      }
    };
    console.log(requestData)
    fetch(url, {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
        "X-CSRF-Token": csrfToken
      },
      body: JSON.stringify(requestData)
    })
      .then(response => {
        if (response.ok) {
          console.log("ok");
        } else {
          console.error("echec", response.status);
        }
      })
  }
}
