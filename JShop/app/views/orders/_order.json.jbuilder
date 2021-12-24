json.extract! order, :id, :user_id, :deal_sum, :delivery_address, :delivery_name, :delivery_phone, :order_status, :created_at, :updated_at
json.url order_url(order, format: :json)
