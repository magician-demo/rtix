import { Controller } from 'stimulus'
import ImageMap from "image-map"

export default class extends Controller {
  connect(){
    ImageMap('img[usemap]')
  }
}