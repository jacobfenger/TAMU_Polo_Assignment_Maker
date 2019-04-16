class AssignmentsController < ApplicationController
	include SessionsHelper

	def new
	  @assignment = Assignment.new
	end 

	def create 
	  @assignment = Assignment.new
	  @assignment.user = current_user
	  p Horse.where(id: params["a"]["horse1"])
	  @assignment.horse1_id = Horse.where(id: params["a"]["horse1"])
	  @assignment.horse2_id = Horse.where(id: params["a"]["horse2"])
	  @assignment.horse3_id = Horse.where(id: params["a"]["horse3"])
	  @assignment.note = params["a"]["note"]

	  p @assignment

	  redirect_to practices_path
	end
end
