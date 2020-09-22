class CommentsController < ApplicationController
  def create
    comment = Comment.create(comment_params)
    redirect_to "/ideas/#{comment.idea.id}"  # コメントと結びつくツイートの詳細画面に遷移する
  end

  private
  def comment_params
    params.require(:comment).permit(:message).merge(user_id: current_user.id, idea_id: params[:idea_id])
  end

end

  