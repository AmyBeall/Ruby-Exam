class UsersController < ApplicationController
 	def new
		@user = User.new
		render '/users/new'
	end	
	def create
		@user = User.create(user_params)
	  	 puts "creating"
	  	if @user.errors.any?
	  	 	render '/users/new'
	  	else
		  	session[:id] = User.last.id
	  		redirect_to '/ideas/index'
		end
	end
	def show
		@user = User.find(params[:id])
		@likes = Like.where(user_id: @user.id)
		@posts = Idea.where(user_id: @user.id)
	end	
	private
	  def user_params
	  	params.require(:user).permit(:name, :alias, :email, :password, :password_confirmation)
	  end
end
