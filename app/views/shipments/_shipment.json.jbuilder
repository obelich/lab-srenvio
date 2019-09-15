json.extract! shipment, :id, :carrier_id, :tracking_number, :created_at, :updated_at
json.url shipment_url(shipment, format: :json)
