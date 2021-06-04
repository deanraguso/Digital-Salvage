class InboxChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    reject unless params[:inbox_id]
    inbox = Inbox.find params[:inbox_id].to_i
    stream_for inbox
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
