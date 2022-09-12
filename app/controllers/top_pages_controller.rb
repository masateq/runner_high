class TopPagesController < ApplicationController
  skip_before_action :require_login, only: %i[tutorial start]

  def top
    @user = User.find(current_user.id)
    @training_suggestion = TrainingSuggestion.find_by(user_id: current_user.id)
  end

  def tutorial
  end

  def start
  end
  
end
