import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["content", "ticket", "host", "calendar"]

  showticket(){
    this.hostTarget.classList.remove('addhostab');  
    this.ticketTarget.classList.add('addticketab');
    
    this.contentTarget.innerHTML = '';
    let ticketTemplate = document.querySelector('#ticketview');
    let ticketview = ticketTemplate.content.cloneNode(true);
    this.contentTarget.appendChild(ticketview);
    $('#table_id').DataTable({
      "scrollY":        "250px",
      "scrollCollapse": true,
      "paging":         false,
      "info":           false,
      responsive: true,
      "columnDefs": [
        { "width": "20%", "targets": 1 }
      ]
  });
  }

  showhost(){
    this.ticketTarget.classList.remove('addticketab');  
    this.hostTarget.classList.add('addhostab');

    this.contentTarget.innerHTML = '';
    let hostTemplate = document.querySelector('#hostview');
    let hostview = hostTemplate.content.cloneNode(true);
    this.contentTarget.appendChild(hostview);
    $('#table_id').DataTable({
      "scrollY":        "250px",
      "scrollCollapse": true,
      "paging":         false,
      "info":           false,
      responsive: true,
      "columnDefs": [
        { "width": "20%", "targets": 1 }
      ]
  });
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