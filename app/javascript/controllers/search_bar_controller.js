import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="search-bar"
export default class extends Controller {

  static targets = ["searchForm", "searchDesk"]

  connect() {


  }

  displaySearch() {
    this.searchFormTarget.classList.toggle('searchAnimate');
  }

  displayDesk() {
    this.searchDeskTarget.classList.toggle('searchAnimate');
  }


}
