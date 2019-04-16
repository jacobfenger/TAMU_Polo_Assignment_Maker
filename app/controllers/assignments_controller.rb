class AssignmentsController < ApplicationController
	include SessionsHelper

	def new
	  @assignment = Assignment.new
	end 

	def create 
	  @assignment = Assignment.new
	  @assignment.user = current_user

	  redirect_to practices_path
	end
end
