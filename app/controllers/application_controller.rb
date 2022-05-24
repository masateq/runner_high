class ApplicationController < ActionController::Base
  before_action :require_login
  
  private
  
  def not_authenticated
    redirect_to login_path
    flash[:danger] = t('defaults.login_fail')
  end

  def forbid_login_user
    if current_user
      flash[:success] = t('defaults.login')
      redirect_to root_path
    end
  end
end
