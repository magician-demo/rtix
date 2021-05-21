import { Controller } from "stimulus"
import axios from 'axios'
export default class extends Controller{
  connect(){
    const overlay = document.getElementById('overlay')
    const ticketInformation = document.querySelector('.ticket_information')
    if(localStorage.getItem('comeBefore') === 'shown'){
      overlay.classList.remove('active')
      ticketInformation.classList.remove('active')
    }
    if(window.history && window.history.pushState){
      window.onpopstate = () => {
        let ax = axios.create()
        let token = document.querySelector('meta[name=csrf-token]').content
        ax.defaults.headers.common['X-CSRF-Token'] = token
        if(confirm('目前的訂單將先行取消，座位亦不保留，您確定要離開嗎？')){
        ax.delete('/carts')
        .then(res=>{
        localStorage.removeItem('comeBefore')
        localStorage.removeItem('currentTime')
        window.location.href = '/events'
        })
        .catch(err=>{
        console.log(err);
        })
      }
      }
    }
  }
  close(){
    const overlay = document.getElementById('overlay')
    const ticketInformation = document.querySelector('.ticket_information')
    overlay.classList.remove('active')
    ticketInformation.classList.remove('active')
    localStorage.setItem('comeBefore', 'shown')
  }
}

function cleanTicket() {
  let ax = axios.create()
  let token = document.querySelector('meta[name=csrf-token]').content
  ax.defaults.headers.common['X-CSRF-Token'] = token
  if(confirm('目前的訂單將先行取消，座位亦不保留，您確定要離開嗎？')){
    ax.delete('/carts')
    .then(res=>{
      localStorage.removeItem('comeBefore')
      window.location.href = '/events'
    })
    .catch(err=>{
    console.log(err);
    })
  }
}