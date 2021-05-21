import { Controller } from "stimulus"
import axios from 'axios'

export default class extends Controller {
  // 讓購物車彈出來的動作
  showCart(){
    const cart = document.querySelector('.cart')
    cart.classList.toggle('show_cart')
    
  };


  // 確認票種明細購物車的渲染
  list_cancelled(){
    let total_price = document.querySelector('.list_cart_total_price')
    // let count = document.getElementById('list_ticket_count')
    let ax = axios.create()
    let token = document.querySelector('meta[name=csrf-token]').content
    ax.defaults.headers.common['X-CSRF-Token'] = token
    const id = this.element.dataset['itemIds']
    ax.delete(`/line_items/${id}`)
    .then(res => {
      total_price.textContent = res.data.total_price
      this.element.parentElement.parentElement.remove()
      total_price.textContent = `${res.data['total_price']}`
      if(res.data.total_price == 0){
        document.querySelector('.showCart').classList.add('hidden')
        document.querySelector('.empty').classList.remove('hidden')
        document.querySelector('.nextone').classList.add('hidden')

      }
      
    })
    .catch(err => {
      console.log(err);
    })
  }
}

