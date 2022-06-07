class UserSessionsController < ApplicationController
  skip_before_action :require_login, only: %i[new create]
  before_action :forbid_login_user, only: %i[new]

  def new
  end

  def create
    @user = login(params[:email], params[:password])
    if @user
      if @user.running_distance && @user.running_hour && @user.running_minute && @user.running_second
        redirect_back_or_to root_path
        flash[:success] = t(".success")
      else
        redirect_to edit_user_path(@user)
        flash[:success] = t(".edit_user")
      end
    else
      flash.now[:danger] = t(".fail")
      render :new
    end
  end

  def destroy
    logout
    redirect_to login_path
    flash[:success] = t(".success")
  end
end
