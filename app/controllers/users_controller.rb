class UsersController < ApplicationController
  def show
    @nickname = current_user.nickname
    @ideas = current_user.ideas
  end
end
