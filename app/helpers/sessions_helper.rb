module SessionsHelper

  def log_in(user)
    session[:user_id] = user.id
    session[:logged_in] = true
  end

  # Returns true if an officer is logged in
  def logged_in
	  return session[:logged_in]
  end

  def current_user
	    if session[:user_id]
        User.find_by(id: session[:user_id])
      end
  end

  # Returns true if the current user is an officer
  def is_officer?
    # We must first check if they are logged in before we can check if they are an officer
    if !logged_in
      return false
    end 

    user = User.find_by_id(session[:user_id]) # Grab user by logged in user_id

    if user.role == "Officer"
      return true
    else
      return false
    end
  end

  def log_out
    session[:logged_in] = false
    session[:user_id] = nil
  end
end
