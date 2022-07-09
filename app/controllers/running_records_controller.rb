class RunningRecordsController < ApplicationController
  before_action :set_running_record, only: %i[edit update destroy]

  def new
    @running_record = RunningRecord.new
  end

  def index
    @running_records = current_user.running_records.order(date: :desc)
    gon.vdot = []
    gon.date = []
    gon.user_vdot = current_user.vdot
    @running_records.each do |running_record|
      if judge_intensity(running_record) && running_record.status == 'open'
        gon.vdot << running_record.vdot
        gon.date << running_record.date
      end
    end
    @running_records = current_user.running_records.order(date: :desc).page(params[:page]).per(10)
  end

  def create
    @running_record = current_user.running_records.build(running_record_params)
    if @running_record.save
      @running_record.update(freq: 1) if judge_intensity(@running_record) # 強度がE/M/Tのときランニング本数は1固定
      redirect_to running_records_path
      flash[:success] = t(".success")
    else
      flash.now[:danger] = t(".fail")
      render :new
    end

  end

  def edit
    gon.user = @running_record.user
    if current_user == @running_record.user
      render :edit
    else
      flash[:danger] = t('defaults.unpermitted')
      redirect_to root_path
    end
  end

  def update
    if @running_record.update(running_record_params)
      @running_record.update(freq: 1) if judge_intensity(@running_record) # 強度がE/M/Tのときランニング本数は1固定
      redirect_to running_records_path
      flash[:success] = t('.success')
    else
      flash.now[:danger] = t('.fail')
      render :edit
    end
  end

  def destroy
    if @running_record.destroy
      redirect_to running_records_path
      flash[:success] = t('.success')
    else
      redirect_to running_records_path
      flash[:danger] = t('.fail')
    end
  end

  def measurement

  end

  private

  def running_record_params
    params.require(:running_record).permit(:date, :running_hour, :running_minute, :running_second, :running_distance, :intensity, :freq, :status)
  end

  def set_running_record
    @running_record = current_user.running_records.find(params[:id])
  end
  
end
