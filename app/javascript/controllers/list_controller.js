import { Controller } from "stimulus"
import axios from 'axios'

export default class extends Controller {
  cancelled(){
    let total_price = document.querySelector('.cart_total_price')
    let count = document.getElementById('ticket_count')
    let ax = axios.create()
    let token = document.querySelector('meta[name=csrf-token]').content
    ax.defaults.headers.common['X-CSRF-Token'] = token
    const id = this.element.dataset['itemId']
    ax.delete(`/line_items/${id}`)
    .then(res => {
      this.element.parentElement.remove()
      if(Number(count.textContent) > 0){
      count.innerHTML = Number(count.textContent) - 1
      }
      total_price.innerHTML = `票券總價：$${res.data['total_price']}`
      if(cart.innerHTML.length <= 180){
        cart.classList.remove('showcart')
      }
    })
    .catch(err=>{
      console.log(err);
    })
  }
}
