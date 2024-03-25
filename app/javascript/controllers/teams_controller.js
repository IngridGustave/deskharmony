import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="teams"
export default class extends Controller {
  connect() {
    console.log("teams controller connected");
  }

  openProfile(event) {
    const userId = event.currentTarget.dataset.id;
    console.log(userId)
    window.location.href = '/users/' + userId;
  }

  openDesk(event) {
    const deskId = event.currentTarget.dataset.id;
    console.log(deskId)
    window.location.href = '/desks/' + deskId;
  }
}
