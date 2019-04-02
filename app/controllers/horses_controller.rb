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
