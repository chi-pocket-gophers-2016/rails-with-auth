class SessionsController < ApplicationController
  def create

    user = User.find_by(username: session_params[:username])

    if user && user.authenticate(session_params[:password])
      session[:user_id] = user.id
      redirect_to root_path
    else
      @message = "that was bad"
      render :new
    end

  end

  def destroy
    session.clear
    redirect_to root_path
  end

  private
    def session_params
      params.permit(:username, :password)
    end
end
