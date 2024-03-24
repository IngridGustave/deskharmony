import { Controller } from "@hotwired/stimulus"

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
    console.log("remove")
    console.log(event.currentTarget.dataset.id);
    if (window.confirm("supprimes tu le rdv?")) {
      const appointmentId = event.currentTarget.dataset.id;
      const csrfToken = document.querySelector('meta[name="csrf-token"]').getAttribute('content');
      const url = '/appointments/' + appointmentId;
      console.log(url)
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


  }
}
