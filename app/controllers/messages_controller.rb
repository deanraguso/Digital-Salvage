class MessagesController < ApplicationController
    def create
        @comment = current_user.commnets.build(comment_params)
    end

    private

    def comment_params
        params.require(:comment).permit(:content)
    end
end
