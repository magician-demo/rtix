import { Controller } from 'stimulus'
import ax from '../lib/ax'

export default class extends Controller {
  addLineItem() {
    let count = document.getElementById('ticket_count')
    const cart = document.querySelector('.cart')
    const booking_id = this.element.dataset['bookingId']
    let total_price = document.querySelector('.cart_total_price')
    const id = this.element.dataset['seatId']
    // 將資料 post 到後端新增訂單資訊
    ax.post('/line_items', { seat_id: id, booking_id: booking_id })
      .then((res) => {
        console.log(res.data);
        count.innerHTML = Number(count.textContent) + 1
        // 即時在 cart 中新增欄位，函式在下方，資料都從後端傳遞過來再進行拆解
        cart.prepend(addList(res.data))
        total_price.innerHTML = `票券總價：$${res.data['total_price']}`
      })
      .catch((err) => {
        alert(err)
      })
  }
}
function addList({ area, id, price, itemId }) {
  let div = document.createElement('div')
  div.innerHTML = `
    <div class="cart_list">
    <span class="px-2">${area}${id}號位</span><br>
    <span class="px-2">$${price}</span>
    <div class="remove_btn" 
         data-controller="booking-cart-list"
         data-action="click->booking-cart-list#cancelled"
         data-item-id="${itemId}"
         >&times;</div>
    </div>`
  return div
}
