class LikesController < ApplicationController
  def create
    @like = Like.new(user_id: current_user.id, idea_id: params[:idea_id])
    @like.save
    redirect_to("/ideas/#{params[:idea_id]}")
  end

  def destroy
    @like = Like.find_by(user_id: current_user.id, idea_id: params[:idea_id])
    @like.destroy
    redirect_to("/ideas/#{params[:idea_id]}")
  end
end
