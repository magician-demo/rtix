import { Controller } from 'stimulus'
import Swal from 'sweetalert2'
import ax from '../lib/ax'

export default class extends Controller {
  connect() {
    initializeClock()
    const element = this.element
    // 判斷 localStorage 中是否已經有存放進入的時間，以利於重整後倒數計時功能還是存在
    if (localStorage.getItem('currentTime')) {
      var currentTime = localStorage.getItem('currentTime')
    } else {
      localStorage.setItem('currentTime', new Date())
    }
    // 設置時間，根據現在時間減去進入的時間得到要倒數的 total 毫秒
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
    // 根據 localStorage 渲染時間， 時間若到將會轉址到活動頁面，此處還能夠在修繕！
    function initializeClock() {
      const timeInterval = setInterval(() => {
        const t = getTimeRemaining(deadline)
        element.innerHTML = `
          您還有${t.minutes}分${t.seconds}秒可以更換座位！
        `
        if (t.total <= 0) {
          clearInterval(timeInterval)
          localStorage.removeItem('currentTime')
          localStorage.removeItem('comeBefore')
          ax.delete('/carts')
            .then(() => {
              window.location.href = '/events'
              Swal.fire('時間已到！請重新購票')
            })
            .catch((err) => {
              console.log(err)
            })
        }
      }, 1000)
    }
  }
}
