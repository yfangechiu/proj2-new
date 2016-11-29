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
    if params[:pet] != nil && params[:pet][:animal_type] != ""
      @pets = Pet.where(:animal_type=>params[:pet][:animal_type])
    end
    if params[:pet] != nil && params[:pet]["start_date(1i)"] != ""
      start_params = params[:pet][:start_date]
      start_date = Date.new(params[:pet]["start_date(1i)"].to_i, params[:pet]["start_date(2i)"].to_i, params[:pet]["start_date(3i)"].to_i)
      @pets = Pet.where(start_date: start_date)
    end
    # if params[:pet] != nil && params[:pet]["start_time(4i)"] != nil
    #   start_time = Time.new(params[:pet]["start_time(1i)"].to_i, params[:pet]["start_time(2i)"].to_i, params[:pet]["start_time(3i)"].to_i, params[:pet]["start_time(4i)"].to_i, params[:pet]["start_time(5i)"].to_i)
    #   start_time = start_time.strftime("%I:%M%p")
    #   @pets = @pets.where(start_time: start_time)
    # end
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
    @pets.delete
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