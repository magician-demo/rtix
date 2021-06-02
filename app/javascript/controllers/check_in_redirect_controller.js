import { Controller } from 'stimulus'
import Swal from 'sweetalert2'
import ax from '../lib/ax'
export default class extends Controller{
  connect(){
    const checkinId = this.element.dataset['checkinId']
    ax.patch(`/checkin/${checkinId}`)
    .then(res => {
      if(res.data['errors'] === 'alread used!'){
        Swal.fire({
          icon: 'error',
          title: '很抱歉！',
          text: '票券已經使用過'
        })
        setInterval(()=>{
          window.location.href = '/events'
        },2000)
      } else {
        Swal.fire(
          '報到成功！',
          '系統將會自動跳轉或是按下方 OK 按鈕',
          'success'
        )
        setInterval(()=>{
          window.location.href = `/checkin/checkin_list/${res.data['event_id']}`
        },2000)
      }
    })
    .catch(err => {
    })
  }
}