json.array!(@orders) do |order|
  json.extract! order, :address, :city, :state
  json.url order_url(order, format: :json)
end