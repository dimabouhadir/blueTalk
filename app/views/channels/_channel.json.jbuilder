json.extract! channel, :id, :name, :number_of_users, :piconet_id, :created_at, :updated_at
json.url channel_url(channel, format: :json)
