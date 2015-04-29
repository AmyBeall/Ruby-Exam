class SessionsController < ApplicationController
def create
  	puts "in sessions create"
  	if params['session']
	  	user = User.authenticate(params['session']['email'], params['session']['password'])
	  	if user == nil
	  		flash[:error] = "Cannot find"
	  		redirect_to '/'
	  	else	
		  	session[:id] = user.id
		  	redirect_to '/ideas/index'
		end  	
	  end
	end	
  def destroy
  	session[:id] = nil
  	redirect_to '/'
  end
end
