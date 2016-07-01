json.array!(@trips) do |trip|
  json.extract! trip, :id, :destination, :date
  json.url trip_url(trip, format: :json)
end
