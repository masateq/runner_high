class RunningRecordsController < ApplicationController
  before_action :set_running_record, only: %i[edit update destroy]

  def new
    @running_record = RunningRecord.new
  end

  def index
    @user = User.find(current_user.id)
    month_records = @user.running_records.order(date: :desc)
    @month_records = []
    month_records.each do |month_record|
      if month_record.date.between?(Date.today - 30.day, Date.today) # 今日の日付から一週間以内の記録だけを抽出
        @month_records << month_record
      end
    end

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
      @running_record.freq_limit
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
      redirect_to running_records_path
    end
  end

  def update
    if @running_record.update(running_record_params)
      @running_record.freq_limit
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

  private

  def running_record_params
    params.require(:running_record).permit(:date, :running_hour, :running_minute, :running_second, :running_distance, :intensity, :freq, :status)
  end

  def set_running_record
    @running_record = current_user.running_records.find(params[:id])
  end
  
end
