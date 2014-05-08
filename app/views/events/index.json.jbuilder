json.(@events) do |event|
  json.id event.id
  json.titel event.title
  json.message event.message
  json.start event.starting_at
  json.end event.ending_at
end

