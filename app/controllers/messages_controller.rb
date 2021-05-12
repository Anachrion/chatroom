class MessagesController < ApplicationController

  def create
    message = Message.new(message_params)
    message.user = current_user
    chatroom = message.chatroom_instance
    if message.save
      ChatroomChannel.broadcast_to chatroom,
        message: message.as_json(methods: :formated_created_at, include: :user )
      head :ok
    end
  end

  private

  def message_params
    params.require(:message).permit(:content, :chatroom_instance_id)
  end
end
