class RequestController < ApplicationController
  def new
    if current_user
      #@curr_user = User.find(current_user.id)
      #@user = User.find(current_user.id)

      @request = Request.new
      @pet = Pet.where(id: params[:pet_id]).first
      #@pet = Pet.find(params[:pet_id])
      @user_id = current_user.id

      if @pet.user_id == @user_id
        redirect_to search_pets_path, notice: "You can't request your own pet! Silly Willy."

      elsif !Request.where(:user_id=>@user_id, :pet_id=>@pet.id).blank?
        #request for this pet already exists
        respond_to do |format|
          format.html{ redirect_to search_pets_path, notice: "You have already requested this pet! Silly Willy."}
        end
        #render html: "<script>alert('You have already created a request for this pet!')</script>".html_safe
      end


    else
      redirect_to new_user_session_path, notice: 'Before making a request, You must log in!'
    end

  end

  def create
    @pet = Pet.where(id: params[:pet_id]).first
    @user_id = params[:curr_user]

    @request = Request.create(:pet_id => params[:pet_id], :user_id => params[:curr_user], :status=>-1, :request_message=> params[:request][:request_message] )

    if !@request.save
      redirect_to create_failed_path
    end

  end

  def create_failed
  end

  def accept
    @request = Request.where(id: params[:request_id]).first
    @request.update(status: 1)
    redirect_to curr_user_path
  end

  def decline
    @request = Request.where(id: params[:request_id]).first
    @request.update(status: 0)
    redirect_to curr_user_path
  end


  def delete
    p = Request.where(:pet_id=>params[:pet_id]).first
    p.delete 
    redirect_to root_path

  end

end