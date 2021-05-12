import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["content", "ticket", "host", "calendar"]

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

  calendartoggle(){
    $("#calendar").slideToggle();
  }

  import(){
    let event = $('.event').text();
    let tMark = 'T'
    let stime = $('.syear').text() + $('.smonth').text() + $('.sdate').text() + tMark + $('.stime').text();
    let etime = $('.eyear').text() + $('.emonth').text() + $('.edate').text() + tMark + $('.etime').text();
    let location = $('.address').text();

    window.open(`https://www.google.com/calendar/render?action=TEMPLATE&sf=true&output=xml&text=${event}&location=${location}&dates=${stime}/${etime}`, '_blank').focus();
    
  }

}