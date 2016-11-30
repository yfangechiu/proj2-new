class PetsController < ApplicationController
  def new
    @pet = Pet.new
    @user_id = params[:curr_user]

  end

  def show
    if current_user
      @user_id = current_user.id
    else
      @user_id = 0
    end
    @pet = Pet.new
    @pets = Pet.all
    if params[:pet] != nil && params[:pet][:animal_type] != ""
      @pets = Pet.where(:animal_type=>params[:pet][:animal_type])
    end
    if params[:pet] != nil && params[:pet]["start_date(1i)"] != ""
      start_date = params[:pet][:start_date]
      @pets = Pet.where(start_date: start_date)
    end
  end

  def create
    @pet = Pet.create(:name => params[:pet][:name],  
      :characteristic=>params[:pet][:characteristic], 
      :animal_type=> params[:pet][:animal_type], 
      :image_url => params[:pet][:image_url],
      :address => params[:pet][:address],
      :start_time=> params[:pet][:start_time],
      :start_date=> params[:pet][:start_date],
      :duration => params[:pet][:duration], :user_id =>params[:curr_user])

    if @pet.save

    #@pet.update_all(:user_id => current_user.id)
    #@pet.update(:user_id => params[:curr_user])
      redirect_to curr_user_path(:curr_user=>params[:curr_user])
    else
      flash[:error] = @pet.errors.first[1]
      #@message.errors[:name].join(", ")
      #flash.now[:error]
      #flash.now[:error] = @message.errors[:name].first 
      redirect_to new_pet_path(:curr_user=>current_user.id)
    end
  end

  def delete
    #delete pet with the params id
    @pets = Pet.where(:id=>params[:pet_id]).first
    @pets.delete
    
    #delete all requests associated with that pet
    @pets.requests.each do |request|
      request.delete
    end

    redirect_to curr_user_path(curr_user: params[:user_id])
  end
end