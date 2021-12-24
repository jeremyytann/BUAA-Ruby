json.extract! s_order, :id, :user_id, :product_id, :quantity, :price, :order_id, :seller_id, :status, :created_at, :updated_at
json.url s_order_url(s_order, format: :json)
