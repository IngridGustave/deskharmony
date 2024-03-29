import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="wagon"
export default class extends Controller {

  static targets = ["st01", "st11", "st12", "st13", "st14", "st21", "st22", "st23"]
  connect() {

    setTimeout(() => {
      this.st01Target.classList.add("wagon-color-red");
      this.st11Target.classList.add("wagon-color-white");
      this.st12Target.classList.add("wagon-color-white");
      this.st13Target.classList.add("wagon-color-white");
      this.st14Target.classList.add("wagon-color-white");
      this.st21Target.classList.add("wagon-color-white");
      this.st22Target.classList.add("wagon-color-white");
      this.st23Target.classList.add("wagon-color-white");
    }, 2000);
  }
}
