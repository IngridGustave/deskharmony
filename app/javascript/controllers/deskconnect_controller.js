import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="deskconnect"
export default class extends Controller {
  static targets = ['link', "modal", "end_date", "start_date", "form", "modalstart", "modalend", "bureauid"]
  connect() {
    fetch('/desks', {
      method: "GET",
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
  form(e) {
    e.preventDefault();
    const url = `${this.formTarget.action}?startdate=${this.start_dateTarget.value}&enddate=${this.end_dateTarget.value}`;

    fetch(url, {
      method: "GET",
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
    this.modalendTarget.value = this.end_dateTarget.value
    this.modalstartTarget.value = this.start_dateTarget.value
    this.bureauidTarget.value = e.target.dataset.bureau
    this
    this.modalTarget.style.display = "block"
    const startdate = e.target.dataset.startdate;
    const enddate = e.target.dataset.enddate;
  }

  submit() {
    const activebook = document.querySelector('.activebook');
    const url = this.formTarget.action;
    const csrfToken = document.querySelector('meta[name="csrf-token"]').getAttribute('content');

    fetch(url, {
      method: "POST",
      headers: {
        "Content-Type": "application/json",
        "X-CSRF-Token": csrfToken
      },
      body: new FormData(this.formTarget)
    })
      .then(response => { response.text() })
      .then(data => {
        console.log(data)
      });

  }
}
