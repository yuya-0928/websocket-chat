class RoomChannel < ApplicationCable::Channel
  def subscribed
    stream_from "room_channel_#{params['room']}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end

  def speak(data)
    # ActionCable.server.broadcast 'room_channel', message: data['message']
    if current_user.nil?
      Message.create! content: data['message'], talent_id: current_talent.id, room_id: params['room']
    else
      Message.create! content: data['message'], user_id: current_user.id, room_id: params['room']
    end
  end
end
