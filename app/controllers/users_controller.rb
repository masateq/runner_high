class UsersController < ApplicationController
  skip_before_action :require_login, only: %i[new create]
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
    params.require(:user).permit(:name, :age, :sex, :weight, :target_hour, :target_minute, :target_second, :target_distance)
  end

  def set_user
    @user = User.find(current_user.id)
  end
end
