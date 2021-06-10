import { Controller } from 'stimulus'

export default class extends Controller {
  static targets = ['sidebar']

  toggle() {
    this.sidebarTarget.classList.toggle('toggle')
  }
}
