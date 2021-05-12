class ChatroomChannel < ApplicationCable::Channel

  def subscribed
    chatroom = ChatroomInstance.find(params[:chatroom_instance_id])
    stream_for chatroom
  end

  def unsubscribed
    stop_all_streams
  end
end
