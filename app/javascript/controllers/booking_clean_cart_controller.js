import { Controller } from 'stimulus'
import ax from '../lib/ax'
export default class extends Controller {
  //取消購票後發送 request 到 carts 的 destroy 清空購物車，且轉址到活動首頁
  emptyCart() {
    if (confirm('目前的訂單將先行取消，座位亦不保留，您確定要重新選票嗎？')) {
      ax.delete('/carts')
        .then(() => {
          localStorage.removeItem('comeBefore')
          localStorage.removeItem('currentTime')
          window.location.href = '/events'
        })
        .catch((err) => {
          alert(err)
        })
    }
  }
}
