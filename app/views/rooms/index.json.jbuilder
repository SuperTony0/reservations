json.array!(@rooms) do |room|
  json.extract! room, :id, :capacity, :description, :location, :number, :price
  json.url room_url(room, format: :json)
end
