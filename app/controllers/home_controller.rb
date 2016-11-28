class HomeController < ApplicationController
	def index
		if current_user
			@curr_user = User.find(current_user.id)
		else
			redirect_to new_user_session_path, notice: 'You are not logged in.'
		end
		#@user = User.where(id:current_user.id)
		#@curr_user = User.find(1) #NS CHANGE THIS!
		#right now it always passes in the first user.
		#Change later so that it passes in current user

	end
end
