class PetsController < ApplicationController
  def new
    @pet = Pet.new
    @user_id = params[:curr_user]

  end

  def show
    #shows all pets in search view that are not owned by this user
    
    #@user_id = params[:curr_user]
    if current_user
      @user_id = current_user.id
    else
      @user_id = 0
    end
    @pet = Pet.new
    @pets = Pet.all
    if params[:pet] != nil && params[:pet][:animal_type]
      @pets = Pet.where(:animal_type=>params[:pet][:animal_type])
    else
      @pets = Pet.all
    end
  end

  def create
    @pet = Pet.create(:name => params[:pet][:name],
      :characteristic=>params[:pet][:characteristic], 
      :animal_type=> params[:pet][:animal_type], 
      :address => params[:pet][:address],
      :start_time=> params[:pet][:start_time],
      :start_date=> params[:pet][:start_date],
      :duration => params[:pet][:duration], :user_id =>params[:curr_user])

    if @pet.save

    #@pet.update_all(:user_id => current_user.id)
    #@pet.update(:user_id => params[:curr_user])
      redirect_to curr_user_path(:curr_user=>params[:curr_user])
    else
      #flash[:error] = @pet.errors.full_messages.to_sentence
      #redirect_to new_pet_path 
      redirect_to root_path
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


  # def filter
  #   #shows all pets in search view that are not owned by this user
  #   if params[:animal_type]
  #     @pets = Pet.where(:animal_type=>params[:animal_type])
  #   else
  #     @pets = Pet.where(:animal_type=>"Dog")
  #   end
  # end
end