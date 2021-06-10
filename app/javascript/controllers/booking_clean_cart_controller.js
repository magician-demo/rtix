import { Controller } from 'stimulus'
import Swal from 'sweetalert2'
import ax from '../lib/ax'
export default class extends Controller {
  //取消購票後發送 request 到 carts 的 destroy 清空購物車，且轉址到活動首頁
  emptyCart() {
    Swal.fire({
      title: '確定嗎?',
      text: '訂單將先行取消，座位亦不保留，您確定要重新選票嗎？',
      icon: 'warning',
      showCancelButton: true,
      confirmButtonColor: '#3085d6',
      cancelButtonColor: '#d33',
      confirmButtonText: '確認',
      cancelButtonText: '取消',
    }).then((res) => {
      if (res.isConfirmed) {
        ax.delete('/carts')
          .then(() => {
            localStorage.removeItem('comeBefore')
            localStorage.removeItem('currentTime')
            localStorage.removeItem('justOnce')
            window.location.href = '/events'
          })
          .catch((err) => {
            alert(err)
          })
      }
    })
  }
}
