class TopPagesController < ApplicationController
  def top
    @user = current_user.id
    @training_suggestion = TrainingSuggestion.find_by(user_id: current_user.id)
  end
end
