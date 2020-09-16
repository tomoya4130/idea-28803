class IdeasController < ApplicationController
  def index
    @ideas = Idea.all
    @ranks = Idea.all
    @news = Idea.all
  end

  def new
    @idea = Idea.new
  end

  def create
    @idea = Idea.new(idea_params)
    if @idea.save
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def idea_params
    params.require(:idea).permit(:genre_id, :image, :title, :content).merge(user_id: current_user.id)
  end

  def message_params
    params.require(:idea).permit(:image, :title).merge(user_id: current_user.id)
  end
end
