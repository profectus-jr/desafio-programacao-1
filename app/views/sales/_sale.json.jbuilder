json.extract! sale, :id, :purchaser_name, :item_description, :item_price, :purchaser_count, :merchant_address, :merchant_name, :created_at, :updated_at
json.url sale_url(sale, format: :json)
