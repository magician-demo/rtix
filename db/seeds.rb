Event.create(
  title: '超好聽演唱會',
  description: 'Good Song Good Singer',
  organization_id: '1',
)
Ticket.create(name: '1A區', price: '3200', amount: '250', event_id: '1')
Ticket.create(name: '1B區', price: '3800', amount: '250', event_id: '1')
Ticket.create(name: '1C區', price: '3800', amount: '250', event_id: '1')
Ticket.create(name: '1D區', price: '3800', amount: '250', event_id: '1')
Ticket.create(name: '1E區', price: '3200', amount: '250', event_id: '1')
Ticket.create(name: '2A區', price: '3200', amount: '250', event_id: '1')
Ticket.create(name: '2B區', price: '3200', amount: '250', event_id: '1')
Ticket.create(name: '2C區', price: '3200', amount: '250', event_id: '1')
Ticket.create(name: '2D區', price: '3200', amount: '250', event_id: '1')
Ticket.create(name: '2E區', price: '3200', amount: '250', event_id: '1')
Ticket.create(name: '2F區', price: '3200', amount: '250', event_id: '1')
Ticket.create(name: '2G區', price: '3200', amount: '250', event_id: '1')
Ticket.create(name: '3A區', price: '2400', amount: '250', event_id: '1')
Ticket.create(name: '3B區', price: '2400', amount: '250', event_id: '1')
Ticket.create(name: '3C區', price: '2400', amount: '250', event_id: '1')
Ticket.create(name: '3D區', price: '2400', amount: '250', event_id: '1')
Ticket.create(name: '3E區', price: '2400', amount: '250', event_id: '1')
Ticket.create(name: '3F區', price: '2400', amount: '250', event_id: '1')
Ticket.create(name: '3G區', price: '2400', amount: '250', event_id: '1')
25.times { Seat.create(area: 'A排', status: 'for_sale', ticket_id: '1') }
25.times { Seat.create(area: 'B排', status: 'for_sale', ticket_id: '1') }
25.times { Seat.create(area: 'C排', status: 'for_sale', ticket_id: '1') }
25.times { Seat.create(area: 'D排', status: 'for_sale', ticket_id: '1') }
25.times { Seat.create(area: 'E排', status: 'for_sale', ticket_id: '1') }
25.times { Seat.create(area: 'F排', status: 'for_sale', ticket_id: '1') }
25.times { Seat.create(area: 'G排', status: 'for_sale', ticket_id: '1') }
25.times { Seat.create(area: 'H排', status: 'for_sale', ticket_id: '1') }
25.times { Seat.create(area: 'I排', status: 'for_sale', ticket_id: '1') }
25.times { Seat.create(area: 'J排', status: 'for_sale', ticket_id: '1') }
25.times { Seat.create(area: 'A排', status: 'for_sale', ticket_id: '2') }
25.times { Seat.create(area: 'B排', status: 'for_sale', ticket_id: '2') }
25.times { Seat.create(area: 'C排', status: 'for_sale', ticket_id: '2') }
25.times { Seat.create(area: 'D排', status: 'for_sale', ticket_id: '2') }
25.times { Seat.create(area: 'E排', status: 'for_sale', ticket_id: '2') }
25.times { Seat.create(area: 'F排', status: 'for_sale', ticket_id: '2') }
25.times { Seat.create(area: 'G排', status: 'for_sale', ticket_id: '2') }
25.times { Seat.create(area: 'H排', status: 'for_sale', ticket_id: '2') }
25.times { Seat.create(area: 'I排', status: 'for_sale', ticket_id: '2') }
25.times { Seat.create(area: 'J排', status: 'for_sale', ticket_id: '2') }
25.times { Seat.create(area: 'A排', status: 'for_sale', ticket_id: '3') }
25.times { Seat.create(area: 'B排', status: 'for_sale', ticket_id: '3') }
25.times { Seat.create(area: 'C排', status: 'for_sale', ticket_id: '3') }
25.times { Seat.create(area: 'D排', status: 'for_sale', ticket_id: '3') }
25.times { Seat.create(area: 'E排', status: 'for_sale', ticket_id: '3') }
25.times { Seat.create(area: 'F排', status: 'for_sale', ticket_id: '3') }
25.times { Seat.create(area: 'G排', status: 'for_sale', ticket_id: '3') }
25.times { Seat.create(area: 'H排', status: 'for_sale', ticket_id: '3') }
25.times { Seat.create(area: 'I排', status: 'for_sale', ticket_id: '3') }
25.times { Seat.create(area: 'J排', status: 'for_sale', ticket_id: '3') }
25.times { Seat.create(area: 'A排', status: 'for_sale', ticket_id: '4') }
25.times { Seat.create(area: 'B排', status: 'for_sale', ticket_id: '4') }
25.times { Seat.create(area: 'C排', status: 'for_sale', ticket_id: '4') }
25.times { Seat.create(area: 'D排', status: 'for_sale', ticket_id: '4') }
25.times { Seat.create(area: 'E排', status: 'for_sale', ticket_id: '4') }
25.times { Seat.create(area: 'F排', status: 'for_sale', ticket_id: '4') }
25.times { Seat.create(area: 'G排', status: 'for_sale', ticket_id: '4') }
25.times { Seat.create(area: 'H排', status: 'for_sale', ticket_id: '4') }
25.times { Seat.create(area: 'I排', status: 'for_sale', ticket_id: '4') }
25.times { Seat.create(area: 'J排', status: 'for_sale', ticket_id: '4') }
25.times { Seat.create(area: 'A排', status: 'for_sale', ticket_id: '5') }
25.times { Seat.create(area: 'B排', status: 'for_sale', ticket_id: '5') }
25.times { Seat.create(area: 'C排', status: 'for_sale', ticket_id: '5') }
25.times { Seat.create(area: 'D排', status: 'for_sale', ticket_id: '5') }
25.times { Seat.create(area: 'E排', status: 'for_sale', ticket_id: '5') }
25.times { Seat.create(area: 'F排', status: 'for_sale', ticket_id: '5') }
25.times { Seat.create(area: 'G排', status: 'for_sale', ticket_id: '5') }
25.times { Seat.create(area: 'H排', status: 'for_sale', ticket_id: '5') }
25.times { Seat.create(area: 'I排', status: 'for_sale', ticket_id: '5') }
25.times { Seat.create(area: 'J排', status: 'for_sale', ticket_id: '5') }
25.times { Seat.create(area: 'A排', status: 'for_sale', ticket_id: '6') }
25.times { Seat.create(area: 'B排', status: 'for_sale', ticket_id: '6') }
25.times { Seat.create(area: 'C排', status: 'for_sale', ticket_id: '6') }
25.times { Seat.create(area: 'D排', status: 'for_sale', ticket_id: '6') }
25.times { Seat.create(area: 'E排', status: 'for_sale', ticket_id: '6') }
25.times { Seat.create(area: 'F排', status: 'for_sale', ticket_id: '6') }
25.times { Seat.create(area: 'G排', status: 'for_sale', ticket_id: '6') }
25.times { Seat.create(area: 'H排', status: 'for_sale', ticket_id: '6') }
25.times { Seat.create(area: 'I排', status: 'for_sale', ticket_id: '6') }
25.times { Seat.create(area: 'J排', status: 'for_sale', ticket_id: '6') }
25.times { Seat.create(area: 'A排', status: 'for_sale', ticket_id: '7') }
25.times { Seat.create(area: 'B排', status: 'for_sale', ticket_id: '7') }
25.times { Seat.create(area: 'C排', status: 'for_sale', ticket_id: '7') }
25.times { Seat.create(area: 'D排', status: 'for_sale', ticket_id: '7') }
25.times { Seat.create(area: 'E排', status: 'for_sale', ticket_id: '7') }
25.times { Seat.create(area: 'F排', status: 'for_sale', ticket_id: '7') }
25.times { Seat.create(area: 'G排', status: 'for_sale', ticket_id: '7') }
25.times { Seat.create(area: 'H排', status: 'for_sale', ticket_id: '7') }
25.times { Seat.create(area: 'I排', status: 'for_sale', ticket_id: '7') }
25.times { Seat.create(area: 'J排', status: 'for_sale', ticket_id: '7') }
25.times { Seat.create(area: 'A排', status: 'for_sale', ticket_id: '8') }
25.times { Seat.create(area: 'B排', status: 'for_sale', ticket_id: '8') }
25.times { Seat.create(area: 'C排', status: 'for_sale', ticket_id: '8') }
25.times { Seat.create(area: 'D排', status: 'for_sale', ticket_id: '8') }
25.times { Seat.create(area: 'E排', status: 'for_sale', ticket_id: '8') }
25.times { Seat.create(area: 'F排', status: 'for_sale', ticket_id: '8') }
25.times { Seat.create(area: 'G排', status: 'for_sale', ticket_id: '8') }
25.times { Seat.create(area: 'H排', status: 'for_sale', ticket_id: '8') }
25.times { Seat.create(area: 'I排', status: 'for_sale', ticket_id: '8') }
25.times { Seat.create(area: 'J排', status: 'for_sale', ticket_id: '8') }
25.times { Seat.create(area: 'A排', status: 'for_sale', ticket_id: '9') }
25.times { Seat.create(area: 'B排', status: 'for_sale', ticket_id: '9') }
25.times { Seat.create(area: 'C排', status: 'for_sale', ticket_id: '9') }
25.times { Seat.create(area: 'D排', status: 'for_sale', ticket_id: '9') }
25.times { Seat.create(area: 'E排', status: 'for_sale', ticket_id: '9') }
25.times { Seat.create(area: 'F排', status: 'for_sale', ticket_id: '9') }
25.times { Seat.create(area: 'G排', status: 'for_sale', ticket_id: '9') }
25.times { Seat.create(area: 'H排', status: 'for_sale', ticket_id: '9') }
25.times { Seat.create(area: 'I排', status: 'for_sale', ticket_id: '9') }
25.times { Seat.create(area: 'J排', status: 'for_sale', ticket_id: '9') }
25.times { Seat.create(area: 'A排', status: 'for_sale', ticket_id: '10') }
25.times { Seat.create(area: 'B排', status: 'for_sale', ticket_id: '10') }
25.times { Seat.create(area: 'C排', status: 'for_sale', ticket_id: '10') }
25.times { Seat.create(area: 'D排', status: 'for_sale', ticket_id: '10') }
25.times { Seat.create(area: 'E排', status: 'for_sale', ticket_id: '10') }
25.times { Seat.create(area: 'F排', status: 'for_sale', ticket_id: '10') }
25.times { Seat.create(area: 'G排', status: 'for_sale', ticket_id: '10') }
25.times { Seat.create(area: 'H排', status: 'for_sale', ticket_id: '10') }
25.times { Seat.create(area: 'I排', status: 'for_sale', ticket_id: '10') }
25.times { Seat.create(area: 'J排', status: 'for_sale', ticket_id: '10') }
25.times { Seat.create(area: 'A排', status: 'for_sale', ticket_id: '11') }
25.times { Seat.create(area: 'B排', status: 'for_sale', ticket_id: '11') }
25.times { Seat.create(area: 'C排', status: 'for_sale', ticket_id: '11') }
25.times { Seat.create(area: 'D排', status: 'for_sale', ticket_id: '11') }
25.times { Seat.create(area: 'E排', status: 'for_sale', ticket_id: '11') }
25.times { Seat.create(area: 'F排', status: 'for_sale', ticket_id: '11') }
25.times { Seat.create(area: 'G排', status: 'for_sale', ticket_id: '11') }
25.times { Seat.create(area: 'H排', status: 'for_sale', ticket_id: '11') }
25.times { Seat.create(area: 'I排', status: 'for_sale', ticket_id: '11') }
25.times { Seat.create(area: 'J排', status: 'for_sale', ticket_id: '11') }
25.times { Seat.create(area: 'A排', status: 'for_sale', ticket_id: '12') }
25.times { Seat.create(area: 'B排', status: 'for_sale', ticket_id: '12') }
25.times { Seat.create(area: 'C排', status: 'for_sale', ticket_id: '12') }
25.times { Seat.create(area: 'D排', status: 'for_sale', ticket_id: '12') }
25.times { Seat.create(area: 'E排', status: 'for_sale', ticket_id: '12') }
25.times { Seat.create(area: 'F排', status: 'for_sale', ticket_id: '12') }
25.times { Seat.create(area: 'G排', status: 'for_sale', ticket_id: '12') }
25.times { Seat.create(area: 'H排', status: 'for_sale', ticket_id: '12') }
25.times { Seat.create(area: 'I排', status: 'for_sale', ticket_id: '12') }
25.times { Seat.create(area: 'J排', status: 'for_sale', ticket_id: '12') }
25.times { Seat.create(area: 'A排', status: 'for_sale', ticket_id: '13') }
25.times { Seat.create(area: 'B排', status: 'for_sale', ticket_id: '13') }
25.times { Seat.create(area: 'C排', status: 'for_sale', ticket_id: '13') }
25.times { Seat.create(area: 'D排', status: 'for_sale', ticket_id: '13') }
25.times { Seat.create(area: 'E排', status: 'for_sale', ticket_id: '13') }
25.times { Seat.create(area: 'F排', status: 'for_sale', ticket_id: '13') }
25.times { Seat.create(area: 'G排', status: 'for_sale', ticket_id: '13') }
25.times { Seat.create(area: 'H排', status: 'for_sale', ticket_id: '13') }
25.times { Seat.create(area: 'I排', status: 'for_sale', ticket_id: '13') }
25.times { Seat.create(area: 'J排', status: 'for_sale', ticket_id: '13') }
25.times { Seat.create(area: 'A排', status: 'for_sale', ticket_id: '14') }
25.times { Seat.create(area: 'B排', status: 'for_sale', ticket_id: '14') }
25.times { Seat.create(area: 'C排', status: 'for_sale', ticket_id: '14') }
25.times { Seat.create(area: 'D排', status: 'for_sale', ticket_id: '14') }
25.times { Seat.create(area: 'E排', status: 'for_sale', ticket_id: '14') }
25.times { Seat.create(area: 'F排', status: 'for_sale', ticket_id: '14') }
25.times { Seat.create(area: 'G排', status: 'for_sale', ticket_id: '14') }
25.times { Seat.create(area: 'H排', status: 'for_sale', ticket_id: '14') }
25.times { Seat.create(area: 'I排', status: 'for_sale', ticket_id: '14') }
25.times { Seat.create(area: 'J排', status: 'for_sale', ticket_id: '14') }
25.times { Seat.create(area: 'A排', status: 'for_sale', ticket_id: '15') }
25.times { Seat.create(area: 'B排', status: 'for_sale', ticket_id: '15') }
25.times { Seat.create(area: 'C排', status: 'for_sale', ticket_id: '15') }
25.times { Seat.create(area: 'D排', status: 'for_sale', ticket_id: '15') }
25.times { Seat.create(area: 'E排', status: 'for_sale', ticket_id: '15') }
25.times { Seat.create(area: 'F排', status: 'for_sale', ticket_id: '15') }
25.times { Seat.create(area: 'G排', status: 'for_sale', ticket_id: '15') }
25.times { Seat.create(area: 'H排', status: 'for_sale', ticket_id: '15') }
25.times { Seat.create(area: 'I排', status: 'for_sale', ticket_id: '15') }
25.times { Seat.create(area: 'J排', status: 'for_sale', ticket_id: '15') }
25.times { Seat.create(area: 'A排', status: 'for_sale', ticket_id: '16') }
25.times { Seat.create(area: 'B排', status: 'for_sale', ticket_id: '16') }
25.times { Seat.create(area: 'C排', status: 'for_sale', ticket_id: '16') }
25.times { Seat.create(area: 'D排', status: 'for_sale', ticket_id: '16') }
25.times { Seat.create(area: 'E排', status: 'for_sale', ticket_id: '16') }
25.times { Seat.create(area: 'F排', status: 'for_sale', ticket_id: '16') }
25.times { Seat.create(area: 'G排', status: 'for_sale', ticket_id: '16') }
25.times { Seat.create(area: 'H排', status: 'for_sale', ticket_id: '16') }
25.times { Seat.create(area: 'I排', status: 'for_sale', ticket_id: '16') }
25.times { Seat.create(area: 'J排', status: 'for_sale', ticket_id: '16') }
25.times { Seat.create(area: 'A排', status: 'for_sale', ticket_id: '17') }
25.times { Seat.create(area: 'B排', status: 'for_sale', ticket_id: '17') }
25.times { Seat.create(area: 'C排', status: 'for_sale', ticket_id: '17') }
25.times { Seat.create(area: 'D排', status: 'for_sale', ticket_id: '17') }
25.times { Seat.create(area: 'E排', status: 'for_sale', ticket_id: '17') }
25.times { Seat.create(area: 'F排', status: 'for_sale', ticket_id: '17') }
25.times { Seat.create(area: 'G排', status: 'for_sale', ticket_id: '17') }
25.times { Seat.create(area: 'H排', status: 'for_sale', ticket_id: '17') }
25.times { Seat.create(area: 'I排', status: 'for_sale', ticket_id: '17') }
25.times { Seat.create(area: 'J排', status: 'for_sale', ticket_id: '17') }
25.times { Seat.create(area: 'A排', status: 'for_sale', ticket_id: '18') }
25.times { Seat.create(area: 'B排', status: 'for_sale', ticket_id: '18') }
25.times { Seat.create(area: 'C排', status: 'for_sale', ticket_id: '18') }
25.times { Seat.create(area: 'D排', status: 'for_sale', ticket_id: '18') }
25.times { Seat.create(area: 'E排', status: 'for_sale', ticket_id: '18') }
25.times { Seat.create(area: 'F排', status: 'for_sale', ticket_id: '18') }
25.times { Seat.create(area: 'G排', status: 'for_sale', ticket_id: '18') }
25.times { Seat.create(area: 'H排', status: 'for_sale', ticket_id: '18') }
25.times { Seat.create(area: 'I排', status: 'for_sale', ticket_id: '18') }
25.times { Seat.create(area: 'J排', status: 'for_sale', ticket_id: '18') }
25.times { Seat.create(area: 'A排', status: 'for_sale', ticket_id: '19') }
25.times { Seat.create(area: 'B排', status: 'for_sale', ticket_id: '19') }
25.times { Seat.create(area: 'C排', status: 'for_sale', ticket_id: '19') }
25.times { Seat.create(area: 'D排', status: 'for_sale', ticket_id: '19') }
25.times { Seat.create(area: 'E排', status: 'for_sale', ticket_id: '19') }
25.times { Seat.create(area: 'F排', status: 'for_sale', ticket_id: '19') }
25.times { Seat.create(area: 'G排', status: 'for_sale', ticket_id: '19') }
25.times { Seat.create(area: 'H排', status: 'for_sale', ticket_id: '19') }
25.times { Seat.create(area: 'I排', status: 'for_sale', ticket_id: '19') }
25.times { Seat.create(area: 'J排', status: 'for_sale', ticket_id: '19') }
