import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["content", "ticket", "host"]

  connect() {
    console.log('Hello, Stimulus!');
  }

  showticket(){
    this.hostTarget.style.background = '';
    this.contentTarget.innerHTML = '';
    this.ticketTarget.style.background = '#FEE2E2';

    let ticketTemplate = document.querySelector('#ticketview');    
    let ticket = ticketTemplate.content.cloneNode(true);
    this.contentTarget.appendChild(ticket);
  }

  showhost(){
    this.ticketTarget.style.background = '';
    this.contentTarget.innerHTML = '';
    this.hostTarget.style.background = '#FEE2E2';

    let hostTemplate = document.querySelector('#hostview');    
    let host = hostTemplate.content.cloneNode(true);
    this.contentTarget.appendChild(host);
  }

  tickethover(){
    this.hostTarget.style.background = '';
  }

  hosthover(){
    this.ticketTarget.style.background = '';
  }

}