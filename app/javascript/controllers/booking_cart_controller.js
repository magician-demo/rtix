import { Controller } from 'stimulus'
import ax from '../lib/ax'

export default class extends Controller {
  // 讓購物車彈出來的動作
  showCart() {
    const cart = document.querySelector('.cart')
    cart.classList.toggle('show_cart')
  }

  // 確認票種明細購物車的渲染
  list_cancelled() {
    let total_price = document.querySelector('.list_cart_total_price')
    const id = this.element.dataset['itemIds']
    ax.delete(`/line_items/${id}`)
      .then((res) => {
        total_price.textContent = res.data.total_price
        this.element.parentElement.parentElement.remove()
        total_price.textContent = `${res.data['total_price']}`
        if (res.data.total_price == 0) {
          document.querySelector('.showcart').classList.add('hidden')
          document.querySelector('.empty').classList.remove('hidden')
          document.querySelector('.nextone').classList.add('hidden')
        }
      })
      .catch((err) => {
        alert(err)
      })
  }
}
