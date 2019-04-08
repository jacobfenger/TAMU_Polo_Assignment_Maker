class UsersController < ApplicationController
  include SessionsHelper

  def show
  	@users = User.all.order(:id) # Grab all users and order
  end

  def new
  	@user = User.new
  end

  def create 
  	@user = User.new(user_params)
  	@user.role = "Officer" # By default, set role to member

  	if @user.save 
  	  flash[:notice] = "Successfully created an account."
  	  log_in @user# If account creation is successful, log the user in
  	  redirect_to root_path
  	else
  	  flash[:notice] = "There was an error in account creation."
  	  render "new"
 	  end 
  end

  def promote
    user_id = params[:format]
    
    if user_id
      user = User.find_by_id(user_id)
      user.update_attribute(:role, "Officer")
    end

    redirect_to users_path
  end

  def demote
    user_id = params[:format]

    if user_id
      user = User.find_by_id(user_id)
      user.update_attribute(:role, "Member")
    end

    redirect_to users_path
  end

  private 
  	# More secure way of adding a user
	# Prevents attacker from inputting their own fields
    def user_params
    	params.require(:user).permit(:first_name, :last_name, :email, :phone, :password, :password_confirmation)
    end
end