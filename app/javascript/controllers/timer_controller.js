import { Controller } from "stimulus"
import axios from 'axios'

export default class extends Controller{
  connect(){
    const element = this.element
    let ax = axios.create()
    let token = document.querySelector('meta[name=csrf-token]').content
    ax.defaults.headers.common['X-CSRF-Token'] = token
    
    if(localStorage.getItem('currentTime')){
      var currentTime = localStorage.getItem('currentTime')
    }else{
      localStorage.setItem('currentTime', new Date())
    }
    const timeInMinutes = 10;
    const deadline = new Date( Date.parse(currentTime) + timeInMinutes*60*1000);

    function getTimeRemaining(endTime){
      const total = Date.parse(endTime) - Date.parse(new Date());
      const seconds = Math.floor( (total/1000) % 60 );
      const minutes = Math.floor( (total/1000/60) % 60 )
      return {
        minutes,
        seconds,
        total
      };
    }

    function initializeClock() {
      const timeInterval = setInterval(()=>{
        const t = getTimeRemaining(deadline)
        element.innerHTML = `
          您還有${t.minutes}分${t.seconds}秒可以更換座位！
        `
        if(t.total <= 0){
          clearInterval(timeInterval)
          localStorage.removeItem('currentTime')
          if(confirm('選位時間已到，將您返回至活動頁面')){
            ax.delete('/carts')
            .then(res=>{
              window.location.href = '/events'
            })
            .catch(err=>{
              console.log(err);
            })
          }
        }
      },1000)
    }
    initializeClock()
  }
  countDown(){
    
  }
}