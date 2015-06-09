json.array!(@properties) do |property|
  json.extract! property, :id, :rooms, :facilities, :category, :rating, :address
  json.url property_url(property, format: :json)
end
