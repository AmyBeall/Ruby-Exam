class LikesController < ApplicationController
	def create
		@like = Like.create(idea_id: params['like']['idea_id'], user_id: params['like']['user_id'])
		count = 0
		puts count
		count = Idea.find(params['like']['idea_id']).count
		if count == nil 
			count = 0
		end	
		puts 'count 2'
		puts count
		count = count + 1
		puts count
		@idea = Idea.find(params['like']['idea_id']).update(count: count)
		redirect_to '/ideas/index'
	end

	private
	  def idea_params
	  	params.require(:likes).permit(:idea_id, :user_id)
	  end
end
