import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="week-calendar"
export default class extends Controller {
  static targets = ["dialog"]

  connect() {
    this.dialogTarget.style.display = 'none';
  }

  open(event) {
    const appointmentId = event.currentTarget.dataset.id;
    window.location.href = '/appointments/' + appointmentId;
  }

  close() {
    this.dialogTarget.style.display = 'none';
  }

}
