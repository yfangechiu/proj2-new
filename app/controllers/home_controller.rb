class HomeController < ApplicationController
	def index
		#@user = User.where(id:current_user.id)
		@curr_user = User.find(1) #NS CHANGE THIS!
		#right now it always passes in the first user.
		#Change later so that it passes in current user

	end
end
