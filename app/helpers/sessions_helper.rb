module SessionsHelper

  def log_in
    session[:officer] = true
  end

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
    session[:officer] = false
    @current_user = nil
  end
end
