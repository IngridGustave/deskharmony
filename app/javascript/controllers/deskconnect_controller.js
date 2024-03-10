import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="deskconnect"
export default class extends Controller {
  static targets = ['link', "modal", "end_date", "start_date", "form", "modalstart", "modalend", "bureauid", "infoNiveau", "infoDispo", "level", "levelid", "desk_book"]
  connect() {
    this.loadingLevel();

  }

  form(e) {
    e.preventDefault();
    const url = `${this.formTarget.action}?startdate=${this.start_dateTarget.value}&enddate=${this.end_dateTarget.value}`;
    this.loadingLevel();
    this._fetchSvg(url);
  }

  book(e) {
    this.modalendTarget.value = this.end_dateTarget.value
    this.modalstartTarget.value = this.start_dateTarget.value
    this.bureauidTarget.value = e.target.dataset.bureau
    this.desk_bookTarget.innerText = "Réservation bureau n°" + e.target.dataset.bureau
    //this.levelidTarget.value = e.target.dataset.bureau
    this
    this.modalTarget.style.display = "flex";

    this.modalTarget.style.width = (window.innerWidth + 1000) + "px";
    this.modalTarget.style.height = (window.innerHeight + 1000) + "px";


    const startdate = e.target.dataset.startdate;
    const enddate = e.target.dataset.enddate;
  }

  submit() {
    this._fetchForm();
  }

  _fetchSvg(url) {
    fetch(url, {
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
    const desks_drawing = Array.from(document.querySelectorAll('rect[data-bureau]'));
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

  loadingLevel(e, etage = "etage1") {
    const param = e ? e.target.dataset.etage : etage;
    this.infoNiveauTarget.innerText = param.charAt(param.length - 1)
    console.log(param.charAt(param.length - 1));

    const url = `/desks?level=${param}`
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
        this._fetchSvg('/desks');
        //console.log(this.levelTarget.innerHTML);
      })



  }

  _fetchForm() {
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
