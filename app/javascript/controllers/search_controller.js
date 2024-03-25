import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="search"
export default class extends Controller {
  connect() {
    console.log("search controller connected");
  }

  open(event) {
    const userId = event.currentTarget.dataset.id;
    console.log(userId)
    window.location.href = '/users/' + userId;
  }

}
