class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_url, notice: "Logged in!"
    else
      flash[:error] = "Username or password is invalid"
      redirect_to login_url
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "Thank you for signing up!"
  end

end
