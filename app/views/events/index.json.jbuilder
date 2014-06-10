json.(@events) do |event|
  json.id event.id
  json.title event.title
  json.message event.message
  json.url url_for(edit_event_path(event.id))
  json.start event.starting_at
  json.end event.ending_at
end

