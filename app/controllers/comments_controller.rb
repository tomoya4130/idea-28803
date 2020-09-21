class CommentsController < ApplicationController
  def new
    @comments = Comment.all
    @comment = Comment.new
  end

  def create
    @comment = Message.new(comment_params)
    if @comment.save
      ActionCable.server.broadcast 'comment_channel', content: @comment
    end
  end
end

  private

  def comment_params
    params.require(:comment).permit(:message).merge(user_id: current_user.id, idea_id: params[:idea_id])
  end