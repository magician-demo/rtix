json.array!(@events) do |event|
  json.title event.title
  json.url event_path(event.id)
end
