class ApplicationController < ActionController::Base
  before_action :require_login
  before_action :set_user_info
  
  private
  
  def set_user_info
    @user = User.find(current_user.id)
    @training_suggestion = TrainingSuggestion.find_by(user_id: current_user.id)
  end

  def not_authenticated
    redirect_to login_path
    flash[:danger] = t('defaults.login_fail')
  end

  def forbid_login_user
    if current_user
      flash[:success] = t('defaults.login_success')
      redirect_to root_path
    end
  end

  def judge_intensity(record)
    record.intensity == 'E'|| record.intensity == 'M'|| record.intensity == 'T'
  end
end
