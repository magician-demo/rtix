import { Controller } from 'stimulus'
export default class extends Controller {
  connect() {
    if (localStorage.justOnce != 'true') {
        localStorage.setItem("justOnce", "true");
        window.location.reload();
    }
    const overlay = document.getElementById('overlay')
    const ticketInformation = document.querySelector('.ticket_information')
    if (localStorage.getItem('comeBefore') === 'shown') {
      overlay.classList.remove('active')
      ticketInformation.classList.remove('active')
    }
  }
  close() {
    const overlay = document.getElementById('overlay')
    const ticketInformation = document.querySelector('.ticket_information')
    overlay.classList.remove('active')
    ticketInformation.classList.remove('active')
    localStorage.setItem('comeBefore', 'shown')
  }
}
