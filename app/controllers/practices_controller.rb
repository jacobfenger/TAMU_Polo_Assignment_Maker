class PracticesController < ApplicationController
  include SessionsHelper

  def show
  	@practices = Practice.all.order(:date) # Grab all users and order
  end

  def new
  	@practice = Practice.new
  end

  def create
  	@practice = Practice.new(practice_params)
  	@practice.user = current_user

  	if @practice.save 
  	  flash[:notice] = "Successfully created a practice"
  	  redirect_to practices_path
  	else
  	  flash[:notice] = "There was an error in practice creation."
  	  render "new"
  	end
  end

  def edit
    @practice = Practice.find params[:format] 
  end

  def save 
    @practice = Practice.find(params[:format])

    if @practice.has_required_fields?
      #@practice.update_attributes!(practice_params)
      @practice.update_attributes(practice_params)
      @practice.save
      flash[:notice] = "Edit successfully."
      redirect_to practices_path
    else
      flash[:notice] = "There was an error in editing the practice."
      render "new"
    end
  end
  
  def delete
    @practice = Practice.find params[:format] 
      @practice.destroy
      redirect_to practices_path
  end

  private
		# More secure way of creating a practice
		# Prevents attacker from inputting their own fields
		def practice_params
			params.require(:p).permit(:time, :date, :summary)
		end
end
