import { Controller } from "stimulus"
import axios from 'axios'

export default class extends Controller {

  showCart(){
    const cart = document.querySelector('.cart')
    cart.classList.toggle('showcart')
    
  };

  cancelled(){
    let total_price = document.querySelector('.cart_total_price')
    let count = document.getElementById('ticket_count')
    let ax = axios.create()
    let token = document.querySelector('meta[name=csrf-token]').content
    ax.defaults.headers.common['X-CSRF-Token'] = token
    const id = this.element.dataset['itemId']
    // ax.delete(`http://127.0.0.1:3000/line_items/${id}`)
    ax.delete(`/line_items/${id}`)
    .then(res => {
      this.element.parentElement.remove()
      count.innerHTML = Number(count.textContent) - 1
      total_price.innerHTML = `票券總價：$${res.data['total_price']}`
      if(cart.innerHTML.length <= 180){
        cart.classList.remove('showcart')
      }
    })
    .catch(err => {
      console.log(err);
    })
  }

  list_cancelled(){
    let total_price = document.querySelector('.list_cart_total_price')
    // let count = document.getElementById('list_ticket_count')
    let ax = axios.create()
    let token = document.querySelector('meta[name=csrf-token]').content
    ax.defaults.headers.common['X-CSRF-Token'] = token
    const id = this.element.dataset['itemIds']
    ax.delete(`/line_items/${id}`)
    .then(res => {
      // console.log(res.data.total_price)
      
      total_price.textContent = res.data.total_price
      // console.log(total_price.textContent)

      // console.log(this)
      this.element.parentElement.parentElement.remove()
      // count.textContent = Number(count.textContent) - 1
      
      // console.log(count.textContent)
      total_price.textContent = `${res.data['total_price']}`
      // if(cart.textContent.length <= 180){
      //   cart.classList.toggle('showcart')
      // }
      
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

