import { Controller } from "@hotwired/stimulus"
import Swal from 'sweetalert2';
window.Swal = Swal;


// Connects to data-controller="deskconnect"
export default class extends Controller {
  static targets = ['formModal', 'link', "modal", "end_date", "start_date", "form", "modalstart", "modalend", "bureauid", "infoNiveau", "infoDispo", "level", "levelid", "desk_book"]
  connect() {
    this._StrokeAnim();
    this.loadingLevel({ url: '/desks', level: 1 });
  }

  form(e) {
    e.preventDefault();
    const url = `${this.formTarget.action}?startdate=${this.start_dateTarget.value}`;
    const level = parseInt(this.infoNiveauTarget.textContent.charAt(this.infoNiveauTarget.textContent.length - 1));
    this.loadingLevel({ url: url, level: level });
  }

  book(e) {
    this.modalstartTarget.value = this.start_dateTarget.value
    this.bureauidTarget.value = e.target.dataset.bureau
    this.desk_bookTarget.innerText = "Réservation bureau n°" + e.target.dataset.bureau
    this.modalTarget.style.display = "flex";
    this.modalTarget.style.width = (window.innerWidth) + "px";
    this.modalTarget.style.height = (window.innerHeight) + 400 + "px";
    document.body.classList.add('modal-open');
  }

  submit(e) {
    document.body.classList.remove('modal-open');
    this.modalTarget.style.display = "none";
    e.preventDefault();
    this._fetchForm(e);

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
              this.infoDispoTarget.innerText = `de ${this.start_dateTarget.value}`;
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
        const queryString = window.location.search;
        const containerSvg = document.querySelector('.container-svg');

        if (queryString == "?anim=true" && !containerSvg.dataset.first) {
          this.levelTarget.classList.add('svg-anim')
          this.levelTarget.innerHTML = data;
          const allRect = this.levelTarget.querySelectorAll("rect");
          setTimeout(() => {
            allRect.forEach((rect, index) => {
              setTimeout(() => {
                setInterval(() => {
                  rect.style.fill = "white";
                }, 200);
              }, index * 20);
            });
          }, 2000);

          setTimeout(() => {
            const calendarSvg = document.querySelector('.calendar-design');
            const calendarblock = document.querySelector('.calendar-block');
            calendarSvg.classList.add('neon-effect');
            calendarSvg.classList.add('neon-effect-anim');
            const strokeCalendar = document.querySelector('.calendar-svg');
            strokeCalendar.style.strokeWidth = 0;
            calendarblock.style.opacity = 1;
            const strokeLevel = document.querySelector('.svg-niveau rect');
            console.log(strokeLevel);
            strokeLevel.style.strokeWidth = 0;
            containerSvg.dataset.first = "anim";
            this.levelTarget.classList.remove('svg-anim');
            containerSvg.classList.add('neon-effect');
            containerSvg.classList.add('neon-effect-anim');

            const titres = document.querySelectorAll('.titre-level');
            titres.forEach((titre) => {
              titre.style.opacity = 1;
            })
            const info = document.querySelector('.bureau-information');
            info.style.opacity = 1;
            const levelUl = document.querySelector('.bureau-level ul');
            levelUl.style.opacity = 1;
            const level = document.querySelector('.bureau-level');
            level.classList.add('neon-effect');
            level.classList.add('neon-effect-anim');

            this.levelTarget.innerHTML = data;
            this._fetchSvg(url);
          }, 3500);



        } else {
          this.levelTarget.innerHTML = data;
          this._fetchSvg(url);
        }

      })
  }

  changeLevel(event) {
    const containerSvg = document.querySelector('.container-svg.neon-effect');

    const url = `/desks?startdate=${this.start_dateTarget.value}`;
    const etage = event.target.dataset.etage
    console.log(etage)
    console.log(typeof (etage))

    if (etage == "2") {
      containerSvg.classList.add('neon-effect-orange');
    }
    else {
      containerSvg.classList.remove('neon-effect-orange');
    }
    const url_level = '/desks?level=' + etage
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
        console.log(data);
        console.log(this.levelTarget)
        this.levelTarget.innerHTML = data;

        this._fetchSvg('/desks');
      })
  }



  _fetchForm(e) {
    const formData = new FormData(e.target.parentNode);
    const parent = e.target.parentNode.parentNode.parentNode.parentNode;
    const form = e.target.parentNode;
    const input = form.querySelector('input[name="appointment[start_at]"');
    this.start_dateTarget.value = input.value;
    const url = this.formModalTarget.action;

    Swal.fire({
      title: 'Confirmer votre réservation?',
      text: "oui oui oui oui! je le veux",
      iconHtml: '<img src="assets/astronaut-ok.png" style="width: 180px; height: 150px;">',
      showCancelButton: true,
      confirmButtonColor: '#3085d6',
      cancelButtonColor: '#d33',
      confirmButtonText: 'Confirmer',
      cancelButtonText: 'Annuler'
    }).then((result) => {
      if (result.isConfirmed) {

        fetch("/appointments", {
          method: "POST",
          headers: { "Accept": "text/plain" },
          body: formData
        })
          .then(response => response.text())
          .then(data => {
            const fetchUrl = `/desks?startdate=${input.value}`;
            const level = parseInt(this.infoNiveauTarget.textContent.charAt(this.infoNiveauTarget.textContent.length - 1));
            this.loadingLevel({ url: fetchUrl, level: level });
            let weekCalendar = document.querySelector('.calendar-design.neon-effect');
            weekCalendar.outerHTML = data;
            const url = `${this.formTarget.action}?startdate=${this.start_dateTarget.value}`;
            this._fetchSvg(url);
            parent.remove();
            const foreignObjects = document.querySelectorAll("foreignObject");
            foreignObjects.forEach((foreignObject) => {
              foreignObject.style.display = "block";
            })


          });

      }
    });


  }

  _StrokeAnim() {
    const containerSvg = document.querySelector('.container-svg.neon-effect');
    const calendarSvg = document.querySelector('.calendar-design.neon-effect');
    const calendarblock = document.querySelector('.calendar-block');
    const queryString = window.location.search;
    if (queryString == "?anim=true" && !containerSvg.dataset.first) {
      const sidebar = document.querySelector('.sidebar');
      const niveauSvgAnim = document.querySelector('.sidebar');
      sidebar.classList.add('anim-sidebar');
      const levelUl = document.querySelector('.bureau-level ul');
      console.log(levelUl)
      levelUl.style.opacity = 0;
      const titres = document.querySelectorAll('.titre-level');
      titres.forEach((titre) => {
        titre.style.opacity = 0;
      })

      const info = document.querySelector('.bureau-information');
      info.style.opacity = 0;
      const level = document.querySelector('.bureau-level');
      level.classList.remove('neon-effect');

      containerSvg.classList.remove('neon-effect');
      calendarSvg.classList.remove('neon-effect');
      calendarblock.style.opacity = 0;


    }
  }


}
