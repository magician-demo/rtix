import { Controller } from "stimulus"
import axios from 'axios'

export default class extends Controller{
  less(){
    if(Number(this.element.nextElementSibling.value) > 0){
      this.element.nextElementSibling.value = Number(this.element.nextElementSibling.value) - 1
    }
  }
  plus(){
    if(Number(this.element.previousElementSibling.value) < 4){
    this.element.previousElementSibling.value = Number(this.element.previousElementSibling.value) + 1
    }
  }
  buyTicket(){
    const allValue = document.querySelectorAll('input')
    let ticketCount = {}
    allValue.forEach((e)=>{
      ticketCount[e.dataset['ticketId']] = e.value
    })
    let ax = axios.create()
    let token = document.querySelector('meta[name=csrf-token]').content
    ax.defaults.headers.common['X-CSRF-Token'] = token
    ax.post('/line_items/random_create', {ticketCount: ticketCount})
      .then(res => {
        location.reload()
      })
      .catch(err =>{
        console.log(err);
      })
    
  }
}