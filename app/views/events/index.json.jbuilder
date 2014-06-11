events = multi(@events)
json.(events) do |event|
  id = event[:id]
  json.id event[:id]
  json.title event[:title]
  json.message event[:message]
  json.url url_for(event_path(id))
  json.start event[:begin]
  json.end event[:end]
end