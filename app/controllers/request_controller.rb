class RequestController < ApplicationController
  def new
  if current_user
    #@curr_user = User.find(current_user.id)
    #@user = User.find(current_user.id)

    @request = Request.new
    @pet = Pet.where(id: params[:pet_id]).first
    #@pet = Pet.find(params[:pet_id])
    @user_id = current_user.id

  else
    redirect_to new_user_session_path, notice: 'Before making a request, You must log in!'
  end


    #if !(Request.where(:user_id=>@user_id, :pet_id=>@pet.id).blank?)
    #  #request for this pet already exists
    #  render html: "<script>alert('You have already created a request for this pet!')</script>".html_safe
    #end

  end

  def create
    @pet = Pet.where(id: params[:pet_id]).first
    @user_id = params[:curr_user]
    @request = Request.create(:pet_id => params[:pet_id], :user_id => params[:curr_user], :status=>false, :request_message=> params[:request][:request_message] )

    if !@request.save
      redirect_to root_path #ns change this to SHOW ERROR MESSAGE instead
    #else show success page
    end

  end

  def accept
    @request = Request.where(id: params[:request_id]).first
    @request.update(status: true)
    redirect_to curr_user_path
  end

  def decline
    @request = Request.where(id: params[:request_id]).first
    @request.update(status: false)
    redirect_to curr_user_path
  end


  def delete
    p = Request.where(:pet_id=>params[:pet_id]).first
    p.delete 
    redirect_to root_path

  end

end