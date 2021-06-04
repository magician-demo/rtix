import { Controller } from 'stimulus'
import ImageMap from "image-map"
import ax from '../lib/ax'

export default class extends Controller {
  connect(){
    if(this.element.classList.contains('hidden')){ return }
    ImageMap('img[usemap]')
    ax.get('/line_items/ticket_list.json')
    .then((res)=> {
      for (let i = 0; i < res.data.length; i++) {
        const area = document.querySelector(`area[href="booking/${res.data[i]}"]`)
        const posX = Number((area.getAttribute('coords').split(',')[0]) * 75 / 1024).toFixed(2)
        const posY = Number((area.getAttribute('coords').split(',')[1] * 66 / 730)).toFixed(2)
        this.element.prepend(createPositionTips(posX, posY))
      }
    })
    .catch(()=>{
    })
  }
}

function createPositionTips(posX, posY) {
  let div = document.createElement('div')
  div.className += 'absolute lg:text-5xl text-xl md:text-2xl'
  div.style.top=`${posY - 1}%`
  div.style.left=`${posX - 2}%`
  div.innerHTML = `<i class="fas fa-street-view"></i>`
  return div
}