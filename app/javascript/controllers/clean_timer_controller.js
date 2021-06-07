import { Controller } from 'stimulus'

export default class extends Controller {
  cleanIt(){
    localStorage.removeItem('currentTime')
    localStorage.removeItem('comeBefore')
    localStorage.removeItem('justOnce')
  }
}