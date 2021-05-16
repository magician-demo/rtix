Event.create(
  title: '演唱會',
  description: '好棒'
)
Ticket.create(
  name: '豪華票',
  price: '1900',
  amount: '250',
  event_id: Event.first.id
)
250.times do
  Seat.create(
    area: 'A區',
    ticket_id: Ticket.first.id,
    status: 'for_sale'
  )
end
