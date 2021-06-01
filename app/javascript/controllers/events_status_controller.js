import { Controller } from 'stimulus'
export default class extends Controller {
  connect() {
    let url = window.location.href
    let splitUrl = url.split('/')
    if (splitUrl[splitUrl.length - 2] === 'events') {
      const finder = findCurrentSpan(1)
      addStatus(finder)
    }
    if (splitUrl[splitUrl.length - 1] === 'booking') {
      const finder = findCurrentSpan(2)
      addStatus(finder)
    }
    if (splitUrl[splitUrl.length - 2] === 'booking') {
      const finder = findCurrentSpan(2)
      addStatus(finder)
    }
  }
}

function findCurrentSpan(id) {
  const main = document.getElementById(id)
  const little = document.getElementById(`n${id}`)
  return { main, little }
}

function addStatus(finder) {
  finder.main.classList.add('current_status')
  finder.little.classList.add('current_status')
}
