json.array!(@spots) do |spot|
  json.extract! spot, :id, :description, :room_id, :user_id
  json.url spot_url(spot, format: :json)
end
