class MessageBroadcastJob < ApplicationJob
    queue_as :default

    def perform(message)
        ActionCable.server.broadcast "inbox_#{message.inbox.id}_channel", message: render_message(message)
    end

    private

    def render_message(message)
        MessagesController.render partial: 'messages/message', locals: {message: message}
    end
end