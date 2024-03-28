import { Controller } from "@hotwired/stimulus"
import Swal from 'sweetalert2';
window.Swal = Swal;


// Connects to data-controller="postformshow"
export default class extends Controller {
  static targets = ["form", "inputstart", "inputend"]
  connect() {

  }


  submit(e) {
    e.preventDefault();
    this._fetchForm(e);
  }


  _fetchForm(e) {
    const formData = new FormData(e.target.parentNode);
    Swal.fire({
      title: 'Confirmer votre réservation?',
      text: "Oui oui oui oui! je le veux",
      iconHtml: '<img src="https://res.cloudinary.com/dvarz39fw/image/upload/v1711619764/lyz9e0kbhmfvyte1gk7t.png" style="width: 150px; height: 150px;">',
      showCancelButton: true,
      confirmButtonColor: '#3085d6',
      cancelButtonColor: '#d33',
      confirmButtonText: 'Confirmer',
      cancelButtonText: 'Annuler'
    }).then((result) => {
      if (result.isConfirmed) {
        const url = this.formTarget.action;
        fetch("/appointments", {
          method: "POST",
          headers: { "Accept": "text/plain" },
          body: formData
        })
          .then(response => response.text())
          .then(data => {
            window.location.reload();
          });

      }
    });
  }
}
