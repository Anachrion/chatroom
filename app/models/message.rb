class Message < ApplicationRecord
  belongs_to :user
  belongs_to :chatroom_instance

  def formated_created_at
    created_at&.strftime("%H:%M | %d %b %Y")
  end
end
