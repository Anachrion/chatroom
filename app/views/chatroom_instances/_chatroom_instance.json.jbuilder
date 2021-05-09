json.extract! chatroom_instance, :id, :name, :created_at, :updated_at
json.url chatroom_instance_url(chatroom_instance, format: :json)
