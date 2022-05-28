class RunningRecordsController < ApplicationController
  before_action :set_running_record, only: %i[edit update]

  def new
    @running_record = RunningRecord.new
  end

  def index
    @running_records = RunningRecord.all.order(created_at: :desc)
  end

  def create
    @running_record = current_user.running_records.build(running_record_params)
    if @running_record.save
      redirect_to running_records_path
      flash[:success] = t(".success")
    else
      flash.now[:danger] = t(".fail")
      render :new
    end

  end

  def edit
    if current_user == @running_record.user
      render :edit
    else
      flash[:danger] = t('defaults.unpermitted')
      redirect_to root_path
    end
  end

  def update
    if @running_record.update(running_record_params)
      redirect_to running_records_path
      flash[:success] = t('.success')
    else
      flash.now[:danger] = t('.fail')
      render :edit
    end
  end

  private

  def running_record_params
    params.require(:running_record).permit(:date, :running_hour, :running_minute, :running_second, :running_distance, :intensity)
  end

  def set_running_record
    @running_record = current_user.running_records.find(params[:id])
  end
  
end
