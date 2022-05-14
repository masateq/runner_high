class TrainingSuggestionsController < ApplicationController
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

  private

  def training_suggestion_params
    params.require(:training_suggestion).permit(:training_distance, :intensity)
  end
end
