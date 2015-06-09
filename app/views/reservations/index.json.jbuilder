json.array!(@reservations) do |reservation|
  json.extract! reservation, :id, :property_id, :from, :to, :user_id
  json.url reservation_url(reservation, format: :json)
end
