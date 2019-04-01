class SessionsController < ApplicationController
  def new
  end

  def create
  	# Grab the entered password
  	password = params[:password][:password]

  	# NOTHING IS ENCRYPTED
  	if (password == "polo")
  		flash[:notice] = "Correct password entered."
  		log_in # Call log in function from app controller
  	  redirect_to root_path # Redirect to home if login successfull
  	else # Incorrect password entered
  		flash[:notice] = "Incorrect password entered."
  		render 'new'
  	end
  end  

  def destroy
  	log_out 
  	redirect_to root_path
  end

end
