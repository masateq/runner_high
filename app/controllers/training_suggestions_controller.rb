class TrainingSuggestionsController < ApplicationController
  before_action :set_training_user, only: %i[show edit update]
  
  def new
    @training_suggestion = TrainingSuggestion.new
  end

  def create
    @training_suggestion = current_user.training_suggestions.build(training_suggestion_params)
    if @training_suggestion.save
      redirect_to training_suggestions_path
      flash[:success] = t(".success")
    else
      flash.now[:danger] = t(".fail")
      render :new
    end

  end

  def show
    if @training_suggestion
      render :show
    else
      flash[:danger] = t('defaults.unpermitted')
      redirect_to root_path
    end
  end

  def edit
    if @training_suggestion
      render :edit
    else
      flash[:danger] = t('defaults.unpermitted')
      redirect_to root_path
    end
  end

  def update
    if @training_suggestion.update(training_suggestion_params)
      redirect_to training_suggestions_path
      flash[:success] = t('.success')
    else
      flash.now[:danger] = t('.fail')
      render :edit
    end
  end

  private

  def training_suggestion_params
    params.require(:training_suggestion).permit(:running_distance, :intensity)
  end

  def set_training_user
    @training_suggestion = TrainingSuggestion.find_by(user_id: current_user.id)
  end
end
