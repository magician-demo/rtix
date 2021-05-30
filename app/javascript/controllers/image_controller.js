import { Controller } from "stimulus"

export default class extends Controller {
  update(e) {
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
    document.querySelector('img').src = e.target.result
  }
}