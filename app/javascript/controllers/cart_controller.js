import { Controller } from "stimulus"
import axios from 'axios'

export default class extends Controller {
  showCart(){
    const cart = document.querySelector('.cart')
    cart.classList.toggle('showcart')
  }

  cancelled(){
    let ax = axios.create()
    let token = document.querySelector('meta[name=csrf-token]').content
    ax.defaults.headers.common['X-CSRF-Token'] = token
    const id = this.element.dataset['seatId']
    ax.delete('http://localhost:3000/line_items',{seat_id: id})
    .then(res => {
      console.log(res);
    })
    .catch(err => {
      console.log(err);
    })
  }
}