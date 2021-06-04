json.data do 
  json.name @seat.ticket.name
  json.area @seat.area
  json.id @seat.id
  json.price @seat.ticket.price
  json.itemId @line_item.id
  json.total_price @total_price
end