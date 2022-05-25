class UsersController < ApplicationController
  skip_before_action :require_login, only: %i[new create]
  before_action :forbid_login_user, only: %i[new]
  before_action :set_user, only: %i[edit update]

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to login_path
      flash[:success] = t(".success")
    else
      flash.now[:danger] = t(".fail")
      render :new
    end
  end

  def edit
    if @user == User.find(params[:id])
      render :edit
    else
      flash[:danger] = t('defaults.unpermitted')
      redirect_to root_path
    end
  end

  def update
    if @user.update(user_update_params)
      redirect_to root_path
      flash[:success] = t(".success")
    else
      flash.now[:danger] = t(".fail")
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation, :sex)
  end

  def user_update_params
    params.require(:user).permit(:name, :age, :sex, :weight, :running_hour, :running_minute, :running_second, :running_distance)
  end

  def set_user
    @user = current_user
  end
end
