import { Controller } from "stimulus"
export default class extends Controller{
  connect(){
    const overlay = document.getElementById('overlay')
    const ticketInformation = document.querySelector('.ticket_information')
    if(localStorage.getItem('popstate') === 'shown'){
      overlay.classList.remove('active')
      ticketInformation.classList.remove('active')
    }
  }
  close(){
    const overlay = document.getElementById('overlay')
    const ticketInformation = document.querySelector('.ticket_information')
    overlay.classList.remove('active')
    ticketInformation.classList.remove('active')
    localStorage.setItem('popstate', 'shown')
  }
}