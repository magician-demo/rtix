import { Controller } from "stimulus"
import axios from 'axios'

export default class extends Controller {
  showCart(){
    const cart = document.querySelector('.cart')
    cart.classList.toggle('showcart')
  };

  cancelled(){
    let count = document.getElementById('ticket_count')
    let ax = axios.create()
    let token = document.querySelector('meta[name=csrf-token]').content
    ax.defaults.headers.common['X-CSRF-Token'] = token
    const id = this.element.dataset['itemId']
    ax.delete(`http://localhost:3000/line_items/${id}`)
    .then(res => {
      this.element.parentElement.remove()
      count.innerHTML = Number(count.textContent) - 1
    })
    .catch(err => {
      console.log(err);
    })
  }
}