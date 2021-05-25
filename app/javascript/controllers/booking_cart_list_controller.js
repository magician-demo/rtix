import { Controller } from 'stimulus'
import axios from 'axios'

export default class extends Controller {
  cancelled() {
    let total_price = document.querySelector('.cart_total_price')
    let count = document.getElementById('ticket_count')
    const cart = document.querySelector('.cart')
    const id = this.element.dataset['itemId']

    let ax = axios.create()
    let token = document.querySelector('meta[name=csrf-token]').content
    ax.defaults.headers.common['X-CSRF-Token'] = token
    // 發送 delete 至 line_items 的 destroy 刪除該筆訂單
    ax.delete(`/line_items/${id}`)
      .then((res) => {
        this.element.parentElement.remove()
        // 即時更新購物清單數字
        if (Number(count.textContent) > 0) {
          count.innerHTML = Number(count.textContent) - 1
        }
        total_price.innerHTML = `票券總價：$${res.data['total_price']}`
        // 判斷若購物車內沒有物品，自動關閉購物車
        if (cart.innerHTML.length <= 180) {
          cart.classList.remove('show_cart')
        }
      })
      .catch((err) => {
        console.log(err)
      })
  }
}
