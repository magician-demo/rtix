require 'faker'


100.times do 
  User.create(
    name: Faker::FunnyName.unique.name, 
    email: Faker::Internet.unique.email,
    tel: Faker::PhoneNumber.cell_phone,
    password: '123456',
    role: 'user',
    status: 'not checked' 
  )
end 


100.times do 
  Organization.create(
    title: Faker::Company.name, 
    description: Faker::Quote.matz,
    user_id: rand(1..100)
  )
end


100.times do 
  Event.create(
    title: Faker::Book.unique.title, 
    description: Faker::Quote.matz,
    address: Faker::Address.full_address,
    location: Faker::Space.agency,
    city: Faker::Address.city,
    s_year: "2021",
    s_month: "08",
    s_date: "12",
    s_time: "0800",
    e_year: "2021",
    e_month: "08",
    e_date: "21",
    e_time: "1300",
    organization_id: rand(1..100)
  )
end 


250.times do
  Ticket.create(
    name: Faker::Games::Pokemon.name,
    price: rand(0..2000),
    amount: %w(50 100 150 200).sample,
    event_id: rand(1..100),
    user_id: rand(1..100)
  )
end 


250.times do
  Seat.create(
    area: %w(A區 B區 C區).sample,
    ticket_id: rand(1..250),
    status: 'for_sale'
  )
end

