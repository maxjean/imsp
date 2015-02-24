class SessionsController < ApplicationController
  def new
    puts "IN NEW SESSION"
  end

  def login
    puts "my-params::#{params}"

    user = User.authenticate(params[:email],params[:password])
    if user
      session[:user_id] = user.id
      redirect_to root_url
    end

  end

  def create
    puts "my-params::#{params}"
    puts "External SNetwork API hash::#{env["omniauth.auth"]}"
    user = User.from_omniauth(env["omniauth.auth"])
    puts "ELEME::#{user}"
    session[:user_id] = user.id
    redirect_to root_url
  end

  def destroy
    @user = User.find(session[:user_id])
    @user.last_connexion = Time.now
    @user.save!
    session[:user_id] = nil
    redirect_to root_url, :notice => "logged out!"
  end
end
