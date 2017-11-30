json.extract! message, :id, :content, :source, :destination, :piconet_id, :received, :to_from_master, :created_at, :updated_at
json.url message_url(message, format: :json)
