import { Controller } from "stimulus"
import axios from 'axios'

export default class extends Controller {
  addLineItem(){
    let count = document.getElementById('ticket_count')
    let ax = axios.create()
    let token = document.querySelector('meta[name=csrf-token]').content
    const id = this.element.dataset['seatId']
    ax.defaults.headers.common['X-CSRF-Token'] = token
    ax.post('http://localhost:3000/line_items',{seat_id: id})
      .then(res =>{
        if(res.data['status'] === 'selected'){
          this.element.classList.add('selected')
          count.innerHTML = Number(count.textContent) + 1
        }
      })
      .catch(err =>{
        console.log(err);
      })
  }
}