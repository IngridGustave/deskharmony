import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="week-calendar"
export default class extends Controller {
  //static targets = ["dialog"]

  connect() {
    console.log("connect")
    //   this.dialogTarget.style.display = 'none';
  }

  open(event) {
    const bureauId = event.currentTarget.dataset.bureau;
    const appointmentId = event.currentTarget.dataset.id;
    window.location.href = '/appointments';

  }

  close() {
    //  this.dialogTarget.style.display = 'none';
  }

  nextWeek(e) {
    e.preventDefault();
    console.log("next week")
    const url = "/desks/weekcalendar"
    fetch(url, {
      method: "GET",
      headers: { "Accept": "text/plain" },
    })
      .then(response => response.text())
      .then((data) => {
        console.log(data);
        let weekCalendar = document.querySelector('.calendar-design.neon-effect');
        console.log(weekCalendar)
        weekCalendar.outerHTML = data;
      })
  }
}
