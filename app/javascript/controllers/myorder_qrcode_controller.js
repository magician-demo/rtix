import { Controller } from 'stimulus'
import QRCode from 'qrcode-js-package'
export default class extends Controller{
  static targets = ['qrcode']
  connect(){
    console.log(this.qrcodeTarget);
    new QRCode(this.qrcodeTarget, '123')
  }
}