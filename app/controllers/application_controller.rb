class ApplicationController < ActionController::Base
  before_action :is_user_banned?
  before_action :configure_permitted_parameters, if: :devise_controller?
  after_action :store_location
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  def is_user_admin?
    authenticate_user!
    unless current_user.admin?
      flash[:alert] = 'You must be an admin to do that.'
      redirect_to root_path
    end
  end  

  def is_user_banned?
    if current_user.present? && current_user.banned?
      sign_out current_user
      flash[:alert] = 'Banned'
      redirect_to page_path('banned')
    end
  end

  

  def store_location
    # store last url as long as it isn't a /users path
    session[:previous_url] = request.fullpath unless request.fullpath =~ /\/users/
  end

  def after_sign_in_path_for(resource)
   entries_path
  end
  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:username, :email, :password, :password_confirmation, :remember_me, :avatar, :avatar_cache) }
    devise_parameter_sanitizer.for(:sign_in) { |u| u.permit(:login, :username, :email, :password, :remember_me) }
    devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:username, :email, :password, :password_confirmation, :current_password, :avatar, :avatar_cache) }
  end
end
