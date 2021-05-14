import { Controller } from "stimulus"

export default class extends Controller {
  showCart(){
    const cart = document.querySelector('.cart')
    cart.classList.toggle('showcart')
  }
}