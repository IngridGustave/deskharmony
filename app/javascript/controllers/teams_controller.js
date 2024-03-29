import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="teams"
export default class extends Controller {
  connect() {
    console.log("teams controller connected");
  }

  openProfile(event) {
    const userId = event.currentTarget.dataset.id;
    window.location.href = '/users/' + userId;
  }

  openDesk(event) {
    const deskId = event.currentTarget.dataset.id;
    window.location.href = '/desks/' + deskId;
  }
}
