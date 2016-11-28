class HomeController < ApplicationController
	def index
		#if current_user
			#@curr_user = User.find(current_user.id)
			
		#else
		#	redirect_to new_user_session_path, notice: 'You are not logged in.'
		#end
		if current_user
			@curr_user_id = current_user.id
		else
			@curr_user_id = nil
		end

	end
end
