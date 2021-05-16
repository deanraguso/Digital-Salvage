class MessagesController < ApplicationController
    def create
        @message = current_user.message.create!
    end

    private

    def message_params
        params.require(:message).permit(:content)
    end
end
