import { Controller } from "stimulus"

export default class extends Controller {
  static targets = ["content", "ticket", "host", "calendar"]



  connect(){
    $('#table_id').DataTable({
      "scrollY":        "200px",
      "scrollCollapse": true,
      "paging":         false,
      "info":           false,
      responsive: true
    });
  }


  showticket(){
    this.hostTarget.classList.remove('addhostab');  
    this.ticketTarget.classList.add('addticketab');
    
    this.contentTarget.innerHTML = '';
    let ticketTemplate = document.querySelector('#ticketview');
    let ticketview = ticketTemplate.content.cloneNode(true);
    this.contentTarget.appendChild(ticketview);
    $('#table_id').DataTable({
      "scrollY":        "200px",
      "scrollCollapse": true,
      "paging":         false,
      "info":           false,
      responsive: true
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
      "scrollY":        "200px",
      "scrollCollapse": true,
      "paging":         false,
      "info":           false,
      responsive: true,
      "columnDefs": [
        { "width": "10%", "targets": 1 },
        { "width": "20%", "targets": 3 }
      ]
  });
  }

  tickethover(){
    this.hostTarget.style.background = '';
  }

  hosthover(){
    this.ticketTarget.style.background = '';
  }


  import(e){

    let row = e.target.parentNode.parentNode.children;
    let event = row[4].textContent;
    let s_year = row[2].textContent;
    let s_month = row[3].textContent;
    let s_date = row[7].children[1].textContent;
    let s_time = row[7].children[4].textContent;
    let e_year = row[2].textContent;
    let e_month = row[3].textContent;
    let e_date = row[8].children[1].textContent;
    let e_time = row[8].children[4].textContent;
    let location = row[6].textContent;

    let tMark = 'T'

    let stime = s_year + s_month + s_date + tMark + s_time;
    let etime = e_year + e_month + e_date + tMark + e_time;

    window.open(`https://www.google.com/calendar/render?action=TEMPLATE&sf=true&output=xml&text=${event}&location=${location}&dates=${stime}/${etime}`, '_blank').focus();
    
    window.location.reload();
  }
}