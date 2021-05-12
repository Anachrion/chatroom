class MessagesController < ApplicationController

  def create
    message = Message.new(message_params)
    message.user = current_user

    if message.save
      ActionCable.server.broadcast 'messages',
        message: message.as_json(methods: :formated_created_at, include: :user )
      head :ok
    end
  end

  private

  def message_params
    params.require(:message).permit(:content, :chatroom_instance_id)
  end
end
