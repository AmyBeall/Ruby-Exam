class IdeasController < ApplicationController
  def index
  	@user = User.find(session[:id])
  	@ideas = Idea.all.order(count: :desc)
  	@users = User.all
  end

  def create
  	@idea = Idea.create(idea_params)
  	redirect_to '/ideas/index'
  end

  def show
  	@idea = Idea.find(params[:id])
  	@likes = Like.where(idea_id: params[:id]).group('user_id')
  	@users = User.all
  end
  	
  def delete
  	@idea = Idea.find(params[:id]).destroy
  	redirect_to '/ideas/index'
  end

  private
    def idea_params
    	params.require(:ideas).permit(:idea, :user_id)
    end
end
