json.(@events) do |event|
  json.id event.id
  json.title event.title
  json.message event.message
  json.start event.starting_at.to_i
  json.end event.ending_at.to_i
end

