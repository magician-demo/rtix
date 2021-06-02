import { Controller } from 'stimulus'
import ax from '../lib/ax'
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
    if (window.history && window.history.pushState) {
      window.onpopstate = () => {
        if (
          confirm(
            '脫離訂位畫面，訂單將先行取消，座位亦不保留，您確定要離開嗎？'
          )
        ) {
          window.location.href = '/events'
          ax.delete('/carts')
            .then((res) => {
              localStorage.removeItem('comeBefore')
              localStorage.removeItem('currentTime')
              localStorage.removeItem('justOnce')
            })
            .catch((err) => {
              console.log(err)
            })
        } else {
          history.pushState('', '', '')
        }
      }
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
