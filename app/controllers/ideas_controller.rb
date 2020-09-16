class IdeasController < ApplicationController
  before_action :login_check, only: :new
  def index
    @ideas = Idea.all
    @ranks = Idea.all.limit(3)
    @novelties = Idea.order('created_at DESC').limit(3)
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
  
  # ログインしていない場合登録画面に遷移する
  def login_check
    unless user_signed_in?
      flash[:alert] = 'ログインしてください'
      redirect_to new_user_session_path
    end
  end
end
