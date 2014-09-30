class ApplicationController < ActionController::Base
  after_action :store_location
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  def is_user_admin
    authenticate_user!
    unless current_user.admin?
      flash[:alert] = 'You must be an admin to do that.'
      redirect_to entries_path
    end
  end  
  

  def store_location
    # store last url as long as it isn't a /users path
    session[:previous_url] = request.fullpath unless request.fullpath =~ /\/users/
  end

  def after_sign_in_path_for(resource)
   session[:previous_url] || root_path
  end
  
  
end
