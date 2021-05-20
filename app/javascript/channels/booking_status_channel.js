import consumer from "./consumer"
document.addEventListener('DOMContentLoaded', ()=>{
  const element = document.querySelector('.seat')
  const booking_id = element.dataset['bookingId']
  consumer.subscriptions.create({channel: 'BookingStatusChannel', booking_id: booking_id}, {
    // 接收廣播的資訊讓所有訂閱者能夠同時收到資訊且更改
    received(data) {
      const seat = document.querySelector(`[data-seat-id='${data.id}']`)
      if(!seat) return
      if(data.message === 'changed!'){
      seat.classList.toggle('selected')
    }
  }
  });
})

  


