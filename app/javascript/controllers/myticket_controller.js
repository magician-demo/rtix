import { Controller } from 'stimulus'
import Swal from 'sweetalert2'

export default class extends Controller {
  static targets = []

  connect() {
    let flash_message = document.querySelector('#flash_message').textContent
    if (flash_message.length > 0) {
      Swal.fire(`${flash_message}`, '按下方 OK 按鈕可關閉此提示訊息', 'success')
    } else {
      console.log('none')
    }
  }
}
