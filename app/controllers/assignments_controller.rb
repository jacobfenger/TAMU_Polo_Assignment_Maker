class AssignmentsController < ApplicationController
	include SessionsHelper

	def show
	  session[:practice] = params["p"] # Pass in practice that we are accessing
	  @assignments = current_practice.assignments.all

	  p "SHOW: "
	  p @assignments
		respond_to do |format|
  		format.html  	
  		format.xls
		end
	end

	def new
	  session[:practice] = params["p"]
	  @assignment = Assignment.new
	end

	def create
	  @assignment = current_practice.assignments.create
	  @assignment.user = current_user
	  @assignment.horse1 = Horse.find_by(id: params["a"]["horse1"])
	  @assignment.horse2 = Horse.find_by(id: params["a"]["horse2"])
	  @assignment.horse3 = Horse.find_by(id: params["a"]["horse3"])
	  @assignment.note = params["a"]["note"]

	  p current_practice.assignments.all

	  if @assignment.save
	  	flash[:notice] = "Successfully signed up"
	  	redirect_to practices_path
	  else
	  	flash[:notice] = "An error occured during signup"
  	  	render "new"
	  end
	end
end
