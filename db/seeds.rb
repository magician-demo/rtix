Ticket.create(
  name: 'A區',
  price: '1900',
  amount: '250',
  event_id: 2
)

Ticket.create(
  name: 'B區',
  price: '1900',
  amount: '250',
  event_id: 2
)

Ticket.create(
  name: 'C區',
  price: '1900',
  amount: '250',
  event_id: 2
)

Ticket.create(
  name: 'D區',
  price: '1900',
  amount: '250',
  event_id: 2
)

Ticket.create(
  name: 'E區',
  price: '1900',
  amount: '250',
  event_id: 2
)

Ticket.create(
  name: 'F區',
  price: '1900',
  amount: '250',
  event_id: 2
)

250.times do
  Seat.create(
    area: "A區",
    ticket_id: 7,
    status: 'for_sale'
  )
end

250.times do
  Seat.create(
    area: 'B區',
    ticket_id: 8,
    status: 'for_sale'
  )
end

250.times do
  Seat.create(
    area: 'C區',
    ticket_id: 9,
    status: 'for_sale'
  )
end

250.times do
  Seat.create(
    area: 'D區',
    ticket_id: 10,
    status: 'for_sale'
  )
end

250.times do
  Seat.create(
    area: 'E區',
    ticket_id: 11,
    status: 'for_sale'
  )
end

250.times do
  Seat.create(
    area: 'F區',
    ticket_id: 12,
    status: 'for_sale'
  )
end
