import { Controller } from 'stimulus'
import QRCode from 'qrcode-js-package'
export default class extends Controller{
  static targets = ['qrcode']
  connect(){
    const checkInId = this.qrcodeTarget.dataset['checkinId']
    new QRCode(this.qrcodeTarget, `https://7cf136ff2ee3.ngrok.io/checkin/${checkInId}`)
  }
}