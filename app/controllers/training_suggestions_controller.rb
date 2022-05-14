class TrainingSuggestionsController < ApplicationController
  def new
    @training_suggestion = TrainingSuggestion.new
  end

  def create
    @training_suggestion = current_user.training_suggestions.build(training_suggestion_params)
    if @training_suggestion.save
      redirect_to training_suggestion_path(@training_suggestion)
      flash[:success] = t(".success")
    else
      flash.now[:danger] = t(".fail")
      render :new
    end

  end

  def show
    @training_suggestion = current_user.training_suggestions.find(params[:id])
  end

  private

  def training_suggestion_params
    params.require(:training_suggestion).permit(:running_distance, :intensity)
  end
end
