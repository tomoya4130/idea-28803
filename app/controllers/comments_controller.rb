class CommentsController < ApplicationController

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      ActionCable.server.broadcast 'comment_channel', content: @comment 
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:message).merge(user_id: current_user.id, idea_id: params[:idea_id])
  end
end

  