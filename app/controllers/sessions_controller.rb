class SessionsController < ApplicationController
  def create
    #auth_hash = request.env['omniauth.auth'] # Got The precise information from facebook
    #if  !auth_hash.nil?
    #  @user = User.find_or_create_from_auth_hash(auth_hash)
    #  self.current_user = @user
    #  redirect_to '/'
    #end
    user = User.from_omniauth(env["omniauth.auth"])
    session[:user_id] = user.id
    redirect_to root_url
  end

  #def failure
  #  flash[:notice] = "Sorry, but you didn't allow access to our app!"
  #  redirect_to '/'
  #end

  def destroy
    session[:user_id]=nil
    redirect_to root_url
  end
end
