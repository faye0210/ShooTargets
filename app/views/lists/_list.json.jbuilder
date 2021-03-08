json.extract! list, :id, :title, :deadline, :user_id, :status, :created_at, :updated_at
json.url list_url(list, format: :json)
