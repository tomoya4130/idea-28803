class LikesController < ApplicationController
  def create
    @like = Like.create(user_id: current_user.id, idea_id: params[:idea_id])
    @likes = Like.where(idea_id: params[:idea_id])
    @ideas = Idea.all
  end

  def destroy
    like = Like.find_by(user_id: current_user.id, idea_id: params[:idea_id])
    like.destroy
    @likes = Like.where(idea_id: params[:idea_id])
    @ideas = Tweet.all
  end
end
