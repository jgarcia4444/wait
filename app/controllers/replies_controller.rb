class RepliesController < ApplicationController
    def create
        reply = Reply.create(reply_params)
        redirect_to comment_path(reply.comment)
    end



    private
        def reply_params
            params.require(:reply).permit(:user_id, :content, :comment_id)
        end
end