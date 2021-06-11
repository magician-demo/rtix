import { $ } from 'datatables.net'
import { Responsive } from 'datatables.net-responsive'
import { Controller } from 'stimulus'
import Swal from 'sweetalert2'

export default class extends Controller {
  static targets = ['content', 'ticket', 'host', 'calendar']

  connect() {
    $('#table_id').DataTable({
      scrollY: '200px',
      scrollCollapse: true,
      paging: false,
      info: false,
      responsive: true,
      retrieve: true
    })

    let flash_message = document.querySelector('#flash_message').textContent
    if (flash_message.length > 0) {
      Swal.fire(`${flash_message}`, '按下方 OK 按鈕可關閉此提示訊息', 'success')
    }
  }

  showticket() {
    this.hostTarget.classList.remove('addhostab')
    this.ticketTarget.classList.add('addticketab')

    this.contentTarget.innerHTML = ''
    let ticketTemplate = document.querySelector('#ticketview')
    let ticketview = ticketTemplate.content.cloneNode(true)
    this.contentTarget.appendChild(ticketview)
    $('#table_id').DataTable({
      scrollY: '200px',
      scrollCollapse: true,
      paging: false,
      info: false,
      responsive: true,
      retrieve: true
    })
  }

  showhost() {
    this.ticketTarget.classList.remove('addticketab')
    this.hostTarget.classList.add('addhostab')

    this.contentTarget.innerHTML = ''
    let hostTemplate = document.querySelector('#hostview')
    let hostview = hostTemplate.content.cloneNode(true)
    this.contentTarget.appendChild(hostview)
    $('#table_id').DataTable({
      scrollY: '200px',
      scrollCollapse: true,
      paging: false,
      info: false,
      responsive: true,
      columnDefs: [{ width: '20%', targets: 1 }],
      retrieve: true
    })
  }

  tickethover() {
    this.hostTarget.style.background = ''
  }

  hosthover() {
    this.ticketTarget.style.background = ''
  }

  import(e) {
    let row = e.target.parentNode.parentNode.children
    let event = row[2].textContent
    let location = row[3].textContent
    let start_time = row[4].textContent
      .substr(0, 16)
      .replace(' ', '')
      .replace(':', '')
      .replace('-', '')
      .replace('-', '')
    let end_time = row[5].textContent
      .substr(0, 16)
      .replace(' ', '')
      .replace(':', '')
      .replace('-', '')
      .replace('-', '')

    let stime = start_time.slice(0, 8) + 'T' + start_time.slice(8, 12)
    let etime = end_time.slice(0, 8) + 'T' + end_time.slice(8, 12)

    window
      .open(
        `https://www.google.com/calendar/render?action=TEMPLATE&sf=true&output=xml&text=${event}&location=${location}&dates=${stime}/${etime}`,
        '_blank'
      )
      .focus()
    window.location.reload()
  }
}
