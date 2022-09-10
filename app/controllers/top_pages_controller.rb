class TopPagesController < ApplicationController
  skip_before_action :require_login, only: %i[tutorial start]

  def top
    @user = User.find(current_user.id)
    @training_suggestion = TrainingSuggestion.find_by(user_id: current_user.id)
    
    month_records = @user.running_records.order(date: :desc)
    @month_records = []
    month_records.each do |month_record|
      if month_record.date.between?(Date.today - 30.day, Date.today) # 今日の日付から一週間以内の記録だけを抽出
        @month_records << month_record
      end
    end
  end

  def tutorial
  end

  def start
  end
  
end
