class TrainingSuggestionsController < ApplicationController
  def new
    @training_suggestion = TrainingSuggestion.new
  end

  def create
    @training_suggestion = TrainingSuggestion.build(training_suggestion_params)
    if @training_suggestion.save
      redirect_to training_suggestion_path(@training_suggestion)
      flash[:success] = t(".success")
    else
      flash.now[:danger] = t(".fail")
      render :new
    end

  end

  def show
    @training_suggestion = TrainingSuggestion.find(params[:id])
    if current_user == @training_suggestion.user
      render :show
    else
      flash[:danger] = t('defaults.unpermitted')
      redirect_to root_path
    end
  end

  def edit
    @training_suggestion = TrainingSuggestion.find(params[:id])
    if current_user == @training_suggestion.user
      render :edit
    else
      flash[:danger] = t('defaults.unpermitted')
      redirect_to root_path
    end
  end

  def update
    @training_suggestion = TrainingSuggestion.find(params[:id])
    if @training_suggestion.update(training_suggestion_params)
      redirect_to training_suggestion_path(@training_suggestion)
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
end
