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
    @pet = Pet.first
    @pets = Pet.all

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
      redirect_to root_path 
    end
  end

  def delete
    #delete pet with the params id
    @pets = Pet.where(:id=>params[:pet_id]).first
    p.delete
    redirect_to curr_user_path(curr_user: params[:user_id])
  end

  # def sort
  #   @pets = Pet.all
  # end

  # def sortPets
  #   @pets = Pet.where(:animal_type=> params[:pet][:animal_type], :start_time=> params[:pet][:start_time], :duration => params[:pet][:duration])

  #   redirect_to curr_user_path(curr_user: params[:user_id])
  # end
end