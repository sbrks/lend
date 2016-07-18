class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_action :current_user


  private

    def current_user 
  	  @current_user ||= session[:user_id] && User.find_by_id(session[:user_id])
    end

  def require_login
  	if !current_user
  		redirect_to root_path
      flash[:error] = "You must sign up or log in to your account first!"
  	end
  end

  helper_method :current_user

  helper_method :location

end
