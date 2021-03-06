import { Controller } from 'stimulus'
import Swal from 'sweetalert2'
import ax from '../lib/ax'

export default class extends Controller {
  showInformation() {
    this.element.firstElementChild.classList.add('showit')
  }
  closeInformation() {
    this.element.firstElementChild.classList.remove('showit')
  }
  addLineItem() {
    let count = document.getElementById('ticket_count')
    const cart = document.querySelector('.cart')
    const booking_id = this.element.dataset['bookingId']
    let total_price = document.querySelector('.cart_total_price')
    const id = this.element.dataset['seatId']
    // 將資料 post 到後端新增訂單資訊
    if (count.textContent < '4') {
      ax.post('/line_items', { seat_id: id, booking_id: booking_id })
        .then((res) => {
          count.innerHTML = Number(count.textContent) + 1
          // 即時在 cart 中新增欄位，函式在下方，資料都從後端傳遞過來再進行拆解
          this.element.classList.add('owner')
          cart.prepend(addList(res.data.data))
          total_price.innerHTML = `票券總價：$${res.data.data['total_price']}`
        })
        .catch((err) => {
          console.log(err)
        })
    } else {
      Swal.fire({
        icon: 'warning',
        title: '很抱歉',
        text: '最多只能購買四張票券！',
      })
    }
  }
}
function addList({ name, area, id, price, itemId }) {
  let div = document.createElement('div')
  div.className += 'cart_list'
  div.innerHTML = `
    <span class="px-2">${name}｜${area}｜${id}號位</span><br>
    <span class="px-2">$${price}</span>
    <div class="remove_btn" 
         data-controller="booking-cart-list"
         data-action="click->booking-cart-list#cancelled"
         data-item-id="${itemId}"
         data-seat-number="${id}"
         >&times;</div>`
  return div
}
