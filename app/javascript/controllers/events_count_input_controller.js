import { Controller } from 'stimulus'
export default class extends Controller {
  connect(){
    const allInput = document.querySelectorAll('.table-row-input')
    const add = document.querySelectorAll('.table-row-add-sub-right')
    setInterval(() => {
      let sum = 0
      for (let i = 0; i < allInput.length; i++) {
        sum += Number(allInput[i].value)
      }
      if(sum >= 4){
        add.forEach((add)=>{
          add.classList.add('unuseful')
        })
      } else {
        add.forEach((add)=>{
          add.classList.remove('unuseful')
        })
      }
    }, 50);
  }
}
