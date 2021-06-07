import { Controller } from 'stimulus'
export default class extends Controller {
  connect() {
    initializeClock()
    const element = this.element
    if (localStorage.getItem('currentTime')) {
      var currentTime = localStorage.getItem('currentTime')
    } else {
      localStorage.setItem('currentTime', new Date())
    }
    const timeInMinutes = 10
    const deadline = new Date(
      Date.parse(currentTime) + timeInMinutes * 60 * 1000
    )
    function getTimeRemaining(endTime) {
      const total = Date.parse(endTime) - Date.parse(new Date())
      const seconds = Math.floor((total / 1000) % 60)
      const minutes = Math.floor((total / 1000 / 60) % 60)
      return {
        minutes,
        seconds,
        total,
      }
    }
    function initializeClock() {
      const timeInterval = setInterval(() => {
        const t = getTimeRemaining(deadline)
        element.innerHTML = `
          知道了！選位時間剩下${t.minutes}分${t.seconds}秒
        `
        if (t.total <= 0) {
          clearInterval(timeInterval)
        }
      })
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
