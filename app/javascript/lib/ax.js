import axios from 'axios'

const ax = axios.create()
let token = document.querySelector('meta[name=csrf-token]').content
ax.defaults.headers.common['X-CSRF-Token'] = token

export default ax
