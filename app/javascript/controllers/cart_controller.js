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
      if(res.data['status'] === 'for_sale'){
        const seat = document.querySelector(`[data-seat-id='${res.data['seat_id']}']`)
        seat.classList.remove('selected')
        count.innerHTML = Number(count.textContent) - 1
      }
      this.element.parentElement.remove()
    })
    .catch(err => {
      console.log(err);
    })
  }
}