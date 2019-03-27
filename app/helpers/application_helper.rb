module ApplicationHelper
  # Returns true if an officer is logged in
  def logged_in?
	!current_user.nil?
  end

  def current_user
	if session[:officer] # If logged in as an officer
	  @current_user = "Officer"
	end
  end

  def log_out
  	p "LOGGING OUT"
    session[:officer] = false
    @current_user = nil
    link_to root_path
  end
end
