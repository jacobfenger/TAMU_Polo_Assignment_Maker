class HorsesController < ApplicationController
	include SessionsHelper # So we can check if logged in 

	def new
		@horse = Horse.new
	end

	def create
		@horse = Horse.new(horse_params)

		# This ensures that a name and age are filled out when
		# adding a horse as an officer
		if @horse.has_required_fields?
			@horse.save
			flash[:notice] = "Horse was saved successfully"
			redirect_to horses_path
		else
			flash[:notice] = "Horse was not saved successfully"
			redirect_to horses_path
		end
	end
	
	def edit
		@horse = Horse.find params[:format] # why is our id called format?
	end
	
	def save # can change create to just use save function after Horse.new
		@horse = Horse.find params[:format]
		if @horse.has_required_fields?
			@horse.update_attributes!(horse_params)
			@horse.save
			redirect_to horses_path
		else
			flash[:notice] = "Both name and age are required."
			redirect_to horses_path
		end
	end
	
	def delete
		@horse = Horse.find params[:format] 
	    @horse.destroy
	    redirect_to horses_path
	end

	def index 
		@horses = Horse.all # Get all horses to be displayed
	end

	private
		# More secure way of adding a horse
		# Prevents attacker from inputting their own fields
		def horse_params
			params.require(:horse).permit(:name, :age, :summary)
		end
end
