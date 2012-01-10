class ApplicationController < ActionController::Base
  protect_from_forgery
  helper_method :current_user, :signed_in?
  
  protected

  def current_user
    @current_user ||= User.find_by_id(session[:user_id])
  end
  
  def current_user=(user)
    if user
      @current_user = user
      session[:user_id] = user.id
    else
      @current_user = nil
      session[:user_id] = nil
    end
  end

  def signed_in?
    !! current_user
  end
end