class UsersController < ApplicationController 
  
  def respond
  end


  def show
    #@user = User.find(1)
	if current_user
		@curr_user = User.find(current_user.id)
		@user = User.find(current_user.id)
	else
		redirect_to new_user_session_path, notice: 'You are not logged in.'
	end


    #@users = User.find(params[:curr_user])
  end

end