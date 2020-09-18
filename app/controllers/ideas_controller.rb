class IdeasController < ApplicationController
  before_action :login_check, only: :new
  def index
    @ranks = Idea.order('likes_count DESC').limit(3)
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

  def show
    @idea = Idea.find(params[:id])
    @likes_count = Like.where(idea_id: @idea.id).count
  end

  def edit
    @idea = Idea.find(params[:id])
  end

  def update
    @idea = Idea.find(params[:id])
    if @idea.update(idea_params)
      redirect_to ideas_path
    else
      render :edit
    end
  end

  def destroy
    @idea = Idea.find(params[:id])
    if @idea.destroy
      redirect_to ideas_path
    else
      render :show
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
