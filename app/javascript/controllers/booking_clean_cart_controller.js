import { Controller } from "stimulus"
import axios from 'axios'
export default class extends Controller{
  //取消購票後發送 request 到 carts 的 destroy 清空購物車，且轉址到活動首頁
  emptyCart(){
    let ax = axios.create()
    let token = document.querySelector('meta[name=csrf-token]').content
    ax.defaults.headers.common['X-CSRF-Token'] = token
    if(confirm('目前的訂單將先行取消，座位亦不保留，您確定要重新選票嗎？')){
      ax.delete('/carts')
      .then(res=>{
        localStorage.removeItem('popstate')
        window.location.href = '/events'
      })
      .catch(err=>{
      console.log(err);
      })
    }
  }
}