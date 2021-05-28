import { Controller } from "stimulus"

export default class extends Controller {
  static targets = [ "imagebox" ]

  connect() {
    console.log('connected!')
  }
  
  update(e) {
    console.log(e.target)
    const image = e.target.files[0]
    readUrl(image)
  }
}

// 取得圖片資訊
function readUrl(input) {
  const reader = new FileReader()
  reader.readAsDataURL(input)
  reader.onload = (e) => {
    // 將圖片塞到 <img>
    document.querySelector('.image').src = e.target.result
  }
}