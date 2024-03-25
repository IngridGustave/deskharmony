import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="showdesk"
export default class extends Controller {
  static targets = ["span", "svg"]
  connect() {
    const foreignObjects = document.querySelectorAll("foreignObject");
    console.log(foreignObjects)
    foreignObjects.forEach((foreignObject) => {
      foreignObject.style.display = "block";
    })

    const nameDesk = this.spanTarget.innerText;

    const svgdesk = this.svgTarget.querySelector(`.svginsertion[data-bureau="${nameDesk}"]`);
    console.log(this.svgTarget)
    console.log(svgdesk)
    svgdesk.classList.add("blink")
  }
}
