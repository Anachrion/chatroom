class Message < ApplicationRecord
  belongs_to :user
  belongs_to :chatroom_instance
end
