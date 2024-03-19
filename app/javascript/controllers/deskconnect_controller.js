import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="deskconnect"
export default class extends Controller {
  static targets = ['link', "modal", "end_date", "start_date", "form", "modalstart", "modalend", "bureauid", "infoNiveau", "infoDispo", "level", "levelid", "desk_book"]
  connect() {
    const url = '/desks'
    const level = 1
    this.loadingLevel({ url: url, level: level });

  }

  form(e) {
    e.preventDefault();
    const url = `${this.formTarget.action}?startdate=${this.start_dateTarget.value}`;
    const level = parseInt(this.infoNiveauTarget.textContent.charAt(this.infoNiveauTarget.textContent.length - 1));
    this.loadingLevel({ url: url, level: level });
  }

  book(e) {
    this.modalendTarget.value = this.end_dateTarget.value
    this.modalstartTarget.value = this.start_dateTarget.value
    this.bureauidTarget.value = e.target.dataset.bureau
    this.desk_bookTarget.innerText = "Réservation bureau n°" + e.target.dataset.bureau
    this.modalTarget.style.display = "flex";
    this.modalTarget.style.width = (window.innerWidth) + "px";
    this.modalTarget.style.height = (window.innerHeight) + 400 + "px";
    document.body.classList.add('modal-open');
  }

  submit() {
    // this._fetchForm();
  }

  _fetchSvg(url) {
    fetch(url, {
      method: "GET",
      headers: { "Accept": "application/json" },
    })
      .then(response => response.json())
      .then((data) => {
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
            if (this.start_dateTarget.value) {
              this.infoDispoTarget.innerText = `de ${this.start_dateTarget.value} à ${this.end_dateTarget.value}`;
            } else {
              this.infoDispoTarget.innerText = "disponibilité actuel"
            }

          } else {
            desk_drawing.style.fill = "#B243BB"
          }
        }
      })
    })
  }

  loadingLevel(options) {
    const { url, level } = options;
    const url_level = '/desks?level=' + level
    fetch(url_level, {
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
        this._fetchSvg(url);
      })
  }

  changeLevel(event) {
    const url = `/desks?startdate=${this.start_dateTarget.value}`;
    console.log(event.target.dataset.etage);
    const url_level = '/desks?level=' + event.target.dataset.etage
    fetch(url_level, {
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
      });
  }

}
