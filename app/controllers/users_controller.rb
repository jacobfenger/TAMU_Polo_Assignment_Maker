class UsersController < ApplicationController
  include SessionsHelper

  def show
    if(params[:officer_sort].nil? == false)
      @sortOfficers = params[:officer_sort]
    elsif(session[:current_officer_sort].nil? == false)
      @sortOfficers = session[:current_officer_sort]
      redNeed = true
    else
      @sortOfficers = "id"
    end
    
    if(params[:member_sort].nil? == false)
      @sortMembers = params[:member_sort]
    elsif(session[:current_member_sort].nil? == false)
      @sortMembers = session[:current_member_sort]
      redNeed = true
    else
      @sortMembers = "id"
    end
    
    if(redNeed == true)
      redirect_to users_path(:officer_sort => @sortOfficers, :member_sort => @sortMembers)
    end
    
    o_sort = "LOWER(" + @sortOfficers + ")"
    m_sort = "LOWER(" + @sortMembers + ")"
    @officers = User.where(role: 'Officer').order(o_sort)
    @members = User.where(role: 'Member').order(m_sort)
    
    session[:current_officer_sort] = @sortOfficers
    session[:current_member_sort] = @sortMembers

  	
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