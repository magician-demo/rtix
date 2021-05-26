import consumer from '../channels/consumer'
import { Controller } from 'stimulus'
export default class extends Controller {
  connect() {
    const element = document.querySelector('.seat')
    if (element) {
      const booking_id = element.dataset['bookingId']
      consumer.subscriptions.create(
        { channel: 'BookingStatusChannel', booking_id: booking_id },
        {
          // 接收廣播的資訊讓所有訂閱者能夠同時收到資訊且更改
          received(data) {
            const seat = document.querySelector(`[data-seat-id='${data.id}']`)
            if (!seat) {
              return
            }
            if (data.message === 'selected!') {
              seat.classList.toggle('selected')
            }
            if (data.message === 'sold!') {
              seat.classList.toggle('sold')
            }
          },
        }
      )
    }
  }
}
