import { Controller } from 'stimulus'
import Swal from 'sweetalert2'
import ax from '../lib/ax'

export default class extends Controller {
  cancelled() {
    let total_price = document.querySelector('.cart_total_price')
    let count = document.getElementById('ticket_count')
    const cart = document.querySelector('.cart')
    const id = this.element.dataset['itemId']
    const seatId = this.element.dataset['seatNumber']
    // 發送 delete 至 line_items 的 destroy 刪除該筆訂單
    if (count.textContent > 1) {
      ax.delete(`/line_items/${id}`)
        .then((res) => {
          if (document.querySelector(`div[data-seat-id="${seatId}"]`)) {
            document
              .querySelector(`div[data-seat-id="${seatId}"]`)
              .classList.remove('owner')
          }
          this.element.parentElement.remove()
          // 即時更新購物清單數字
          if (Number(count.textContent) > 0) {
            count.innerHTML = Number(count.textContent) - 1
          }
          total_price.innerHTML = `票券總價：$${res.data['total_price']}`
        })
        .catch((err) => {
          console.log(err)
        })
    } else {
      Swal.fire({
        icon: 'error',
        title: '很抱歉！',
        text: '請勿將購票清單清空',
      })
      cart.classList.remove('show_cart')
    }
  }
}
