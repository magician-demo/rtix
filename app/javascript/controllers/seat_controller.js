import { Controller } from "stimulus"
import axios from 'axios'

export default class extends Controller {
  addLineItem(){
    let ax = axios.create()
    let token = document.querySelector('meta[name=csrf-token]').content
    const id = this.element.dataset['seatId']
    ax.defaults.headers.common['X-CSRF-Token'] = token
    ax.post('http://localhost:3000/line_items',{seat_id: id})
      .then(res =>{
        console.log(res);
      })
      .catch(err =>{
        console.log(err);
      })
  }
}