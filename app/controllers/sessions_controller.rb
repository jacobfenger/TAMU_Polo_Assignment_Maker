class SessionsController < ApplicationController

  def new

  end

  def create

    # Grab user based on email
    user = User.find_by(email: params[:session][:email].downcase)

    if user && user.authenticate(params[:session][:password]) 
      log_in user
      redirect_to root_path
    else
      # Incorrect password or email
      flash[:notice] = "Invalid email or password entered."
      render 'new'
    end
  end  

  def destroy
  	log_out 
  	redirect_to root_path
  end

end
