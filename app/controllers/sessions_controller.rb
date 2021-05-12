class SessionsController < ApplicationController
  skip_before_action :authenticate_user!

  def new
    @user = User.new
  end

  def create
    user = User.find_or_initialize_by(username: user_params[:username])
    user.status = user_params[:status]
    user.save!
    session[:user_id] = user.id
    redirect_to chatroom_instances_path, notice: "You're now logged in as #{user.username}."
  end

  def destroy
    reset_session
    redirect_to root_path, notice: "You're now logged out."
  end

  private

  def user_params
    params.require(:user).permit(:username, :status)
  end
end
