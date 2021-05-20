import { Controller } from "stimulus"

export default class extends Controller {
  // 讓購物車彈出來的動作
  showCart(){
    const cart = document.querySelector('.cart')
    cart.classList.toggle('showcart')
  }
}

