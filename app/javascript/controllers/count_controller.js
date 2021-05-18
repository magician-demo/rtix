import { Controller } from "stimulus"

export default class extends Controller{
  less(){
    if(Number(this.element.nextElementSibling.value) > 0){
      this.element.nextElementSibling.value = Number(this.element.nextElementSibling.value) - 1
    }
  }
  plus(){
    if(Number(this.element.previousElementSibling.value) < 4){
    this.element.previousElementSibling.value = Number(this.element.previousElementSibling.value) + 1
    }
  }
}


function plus(number) {
  
}