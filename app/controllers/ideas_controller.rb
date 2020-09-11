class IdeasController < ApplicationController
  def index
    @ideas = Idea.all
    @ranks = Idea.all 
    @news = Idea.all
  end
end
