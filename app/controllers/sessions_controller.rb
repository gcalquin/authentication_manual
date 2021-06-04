class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      redirect_to root_url, :notice => "Login correcto"
    else
     redirect_to root_url, :aler => "Error"
    end
  end

  def destroy
    session.delete(:user_id)
    redirect_to root_url, :notice => "Session Cerrada"
  end
end
