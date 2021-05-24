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
        if(confirm('脫離訂位畫面，訂單將先行取消，座位亦不保留，您確定要離開嗎？')){
        window.location.href = '/events'
        ax.delete('/carts')
        .then(res=>{
          localStorage.removeItem('comeBefore')
          localStorage.removeItem('currentTime')
        })
        .catch(err=>{
          console.log(err);
        })
        }else{
          history.pushState('', '', '')
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