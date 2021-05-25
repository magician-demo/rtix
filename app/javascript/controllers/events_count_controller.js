import { Controller } from 'stimulus'
import axios from 'axios'

export default class extends Controller {
  // 針對表單操控按鈕加減 input 中的 value
  less() {
    if (Number(this.element.nextElementSibling.value) > 0) {
      this.element.nextElementSibling.value =
        Number(this.element.nextElementSibling.value) - 1
    }
  }
  // 針對表單操控按鈕加減 input 中的 value
  plus() {
    if (Number(this.element.previousElementSibling.value) < 4) {
      this.element.previousElementSibling.value =
        Number(this.element.previousElementSibling.value) + 1
    }
  }
  buyTicket() {
    const allValue = document.querySelectorAll('input')
    history.pushState('', '', '')
    let ticketCount = {}
    // 這邊將表單的 ticket_id 和 input 的 value 組合成一個 array 放入 空的 hash 中，要傳到後端讓後端拆解
    allValue.forEach((e) => {
      ticketCount[e.dataset['ticketId']] = e.value
    })
    let ax = axios.create()
    let token = document.querySelector('meta[name=csrf-token]').content
    ax.defaults.headers.common['X-CSRF-Token'] = token
    ax.post('/line_items/random_create', { ticketCount: ticketCount })
      .then((res) => {
        // 此處待解決！ 若是不 reload 購物清單的數字不會即時更新
        location.reload()
      })
      .catch((err) => {
        console.log(err)
      })
  }
}
