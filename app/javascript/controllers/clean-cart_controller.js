import { Controller } from "stimulus"
import axios from 'axios'
export default class extends Controller{
  emptyCart(){
    let ax = axios.create()
    let token = document.querySelector('meta[name=csrf-token]').content
    ax.defaults.headers.common['X-CSRF-Token'] = token
    ax.delete('/carts')
    .then(res=>{
    })
    .catch(err=>{
      console.log(err);
    })
  }
}