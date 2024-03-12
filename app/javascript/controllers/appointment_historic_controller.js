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

}
