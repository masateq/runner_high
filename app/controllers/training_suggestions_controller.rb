class TrainingSuggestionsController < ApplicationController
  before_action :set_training_user, only: %i[show edit update]
  
  def new
    @training_suggestion = TrainingSuggestion.new
  end

  def create
    @training_suggestion = current_user.training_suggestions.build(training_suggestion_params)
    if @training_suggestion.save
      judge_intensity # 強度がE/M/Tのときランニング本数は1固定
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
      judge_intensity  # 強度がE/M/Tのときランニング本数は1固定
      redirect_to training_suggestions_path
      flash[:success] = t('.success')
    else
      flash.now[:danger] = t('.fail')
      render :edit
    end
  end

  private

  def training_suggestion_params
    params.require(:training_suggestion).permit(:running_distance, :intensity, :adjust_intensity, :times)
  end

  def set_training_user
    @training_suggestion = TrainingSuggestion.find_by(user_id: current_user.id)
  end

  def judge_intensity
    @training_suggestion.update(times: 1) if @training_suggestion.intensity == 'E'|| @training_suggestion.intensity == 'M'|| @training_suggestion.intensity == 'T'
  end

end
