class SessionsController < ApplicationController
  # Application root.
  def new
    session[:omni] = nil
    current_user
  end
  
  # Called by "auth/:provider/callback".
  def create
    omni = request.env['omniauth.auth']
    redirect_to new_user_path && return if !omni
    
    if session[:omni] && session[:omni]['provider'] != omni['provider']
      # I believe this will only happen if the user attempted to log in with an
      # "additional" auth on an existing account, failed, then authed with their
      # "original" auth, so what I'll do is add the working auth's auth.user to 
      # the new auth. This way either auth should work next time.
      addl_auth = Auth.find_or_create_by_provider_and_uid(session[:omni]['provider'], session[:omni]['uid'])
    end
    
    auth = Auth.find_or_create_by_provider_and_uid(omni['provider'], omni['uid'])
    if auth.user
      self.current_user = auth.user
      
      if addl_auth
        addl_auth.user = current_user
        addl_auth.save
      end
      
      redirect_to root_url, :notice => "Signed in as #{current_user.name} via #{auth.provider.capitalize}."
    else
      session[:omni] = omni.except(:extra)
      redirect_to new_user_path
    end
  end
  
  def destroy
    self.current_user = nil
    redirect_to root_url, :notice => "Signed out."
  end
  
  def failure
    redirect_to root_url, :alert => "Authentication failed. Please try again."
  end
end
