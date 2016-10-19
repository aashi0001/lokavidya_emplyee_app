json.extract! subcategory, :id, :category_id, :subcategory_name, :is_active, :created_at, :updated_at
json.url subcategory_url(subcategory, format: :json)