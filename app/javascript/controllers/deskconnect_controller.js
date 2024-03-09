import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="deskconnect"
export default class extends Controller {
  static targets = ['link', "modal", "end_date", "start_date", "form", "modalstart", "modalend", "bureauid", "infoNiveau", "infoDispo", "level"]
  connect() {

    this._fetchSvg();
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
        console.log(data)
        // récupération des bureaux de l'étage issue de l'HTML
        const desks_drawing = Array.from(this.linkTarget.querySelectorAll('rect[data-bureau]'));
        desks_drawing.forEach((desk_drawing) => {
          data.forEach((desk) => {
            if (desk.name === desk_drawing.dataset.bureau) {
              if (desk.dispo) {
                desk_drawing.style.fill = "#00D0DD"
                this.infoNiveauTarget.innerText = `Niveau ${desk.level}`;
                this.infoDispoTarget.innerText = `Disponibilité de ${this.start_dateTarget.value} à ${this.end_dateTarget.value} `;
              } else {
                desk_drawing.style.fill = "#B243BB"
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



  _fetchSvg() {
    this._loadingLevel();

    fetch('/desks', {
      method: "GET",
      headers: { "Accept": "application/json" },
    })
      .then(response => response.json())
      .then((data) => {
        console.log(data)
        this._addStyleToSvg(data);
      })
  }

  _addStyleToSvg(data) {
    const desks_drawing = Array.from(this.linkTarget.querySelectorAll('rect[data-bureau]'));
    desks_drawing.forEach((desk_drawing) => {
      data.forEach((desk) => {
        if (desk.name === desk_drawing.dataset.bureau) {
          if (desk.dispo) {
            desk_drawing.style.fill = "#00D0DD"
            this.infoNiveauTarget.innerText = `Niveau ${desk.level}`;
            this.infoDispoTarget.innerText = `Disponibilité actuelle`;
          } else {
            desk_drawing.style.fill = "#B243BB"
          }
        }
      })
    })
  }

  _loadingLevel() {
    const url = "/desks?level=etage1"
    fetch(url, {
      method: "GET",
      headers: { "Accept": "text/plain" },
    })
      .then(response => response.text())
      .then((data) => {
        data = data.replaceAll("&lt;", "<")
        data = data.replaceAll("&gt;", ">")
        data = data.replaceAll("&#39", "'")
        data = data.replaceAll(";", "")
        this.levelTarget.innerHTML = data;
      })
  }

}
