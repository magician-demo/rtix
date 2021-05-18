import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["content", "ticket", "host", "calendar"]

  showticket(){
    this.hostTarget.style.background = '';
    this.ticketTarget.style.background = '#FEE2E2';


  }

  showhost(){
    this.ticketTarget.style.background = '';
    this.hostTarget.style.background = '#FEE2E2';

  }

  tickethover(){
    this.hostTarget.style.background = '';
  }

  hosthover(){
    this.ticketTarget.style.background = '';
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