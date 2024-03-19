import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="appointment-historic"
export default class extends Controller {
  connect() {
    console.log("Hello, Stimulus!")
  }

  open(event) {
    const appointmentId = event.currentTarget.dataset.id;
    window.location.href = '/appointments/' + appointmentId;
  }

  remove(event){
    console.log("remove")
    console.log(event.currentTarget.dataset.id)
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
