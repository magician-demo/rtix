import { Controller } from "stimulus"
import axios from 'axios'
import consumer from "../channels/consumer"


export default class extends Controller {
  
  addLineItem(){
    let count = document.getElementById('ticket_count')
    const cart = document.querySelector('.cart')
    let ax = axios.create()
    let token = document.querySelector('meta[name=csrf-token]').content
    const id = this.element.dataset['seatId']
    ax.defaults.headers.common['X-CSRF-Token'] = token
    ax.post('http://localhost:3000/line_items',{seat_id: id})
      .then(res =>{
        if(res.data['status'] === 'selected'){
          count.innerHTML = Number(count.textContent) + 1
          cart.prepend(addList(res.data['area'], res.data['id'], res.data['price'], res.data['itemId']))
        }
      })
      .catch(err =>{
        console.log(err);
      })
  }
  connect(){
    this.channel = consumer.subscriptions.create({channel: 'SeatStatusChannel', seat_id: this.element.dataset['seatId']},{
      connected: this._cableConnected.bind(this),
      disconnected: this._cableDisconnected.bind(this),
      received: this._cableReceived.bind(this)
    })
  }
  _cableConnected(){
  }
  _cableDisconnected(){
  }
  _cableReceived(data){
    const seat = document.querySelector(`[data-seat-id='${data.id}']`)
    if(data.message === 'changed!'){
      seat.classList.toggle('selected')
    }
  }
}


function addList(area, id, price, itemId) {
  let div = document.createElement('div')
  div.innerHTML = `
    <div class="cart_list">
    <span class="px-2">${area}${id}號位</span><br>
    <span class="px-2">$${price}</span>
    <div class="remove_btn" 
         data-controller="cart"
         data-action="click->cart#cancelled"
         data-item-id="${itemId}"
         >Ｘ</div>
    </div>`
  return div
}
