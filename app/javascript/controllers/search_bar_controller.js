import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="search-bar"
export default class extends Controller {

  static targets = ["searchForm"]

  connect() {


  }

  display() {
    console.log("searchbar")
    this.searchFormTarget.classList.toggle('searchAnimate');
  }


}
