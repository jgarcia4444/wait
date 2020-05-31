class CommentsController < ApplicationController
    def show
        @comment = Comment.find(params[:id])
    end
    def create
        if params[:health_tip_id]
            comment = Comment.create(comment_params)
            redirect_to health_tip_path(comment.health_tip)
        else
            flash[:alert] = "You should not have been able to submit a comment without a health_tip_id."
            render :'health_tips/show'
        end
    end


    private
        def comment_params
            params.require(:comment).permit(:content, :health_tip_id, :user_id)
        end
end