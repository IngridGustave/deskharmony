import { Controller } from "@hotwired/stimulus"
import Swal from 'sweetalert2';
window.Swal = Swal;

// Connects to data-controller="appointment-historic"
export default class extends Controller {
  connect() {
    console.log("Hello, Stimulus!")
  }

  open(event) {
    const deskId = event.currentTarget.dataset.id;
    console.log(deskId)
    window.location.href = '/desks/' + deskId;
  }

  remove(event) {
    const appointmentId = event.currentTarget.dataset.id;
    Swal.fire({
      title: 'Êtes-vous sûr?',
      text: "Voulez-vous vraiment supprimer ce rendez-vous?",
      icon: 'warning',
      showCancelButton: true,
      confirmButtonColor: '#3085d6',
      cancelButtonColor: '#d33',
      confirmButtonText: 'Supprimer',
      cancelButtonText: 'Annuler'
    }).then((result) => {
      if (result.isConfirmed) {
        const csrfToken = document.querySelector('meta[name="csrf-token"]').getAttribute('content');
        const url = '/appointments/' + appointmentId;
        fetch('/appointments/' + appointmentId, {
          method: "DELETE",
          headers: {
            "Content-Type": "application/json",
            "X-CSRF-Token": csrfToken
          }
        })
          .then(response => {
            window.location.reload();
          });
      }
    });
  }

}
