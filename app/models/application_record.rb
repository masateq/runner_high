class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  # 走行時間を分で換算    
  def convert_minute
    self.running_hour * 60 + self.running_minute + self.running_second.to_f / 60
  end
  
  # 走行時間から%VO2max
  def vdot_percent
    0.8 + 0.1894393 * Math.exp(-0.012778 * convert_minute) + 0.2989558 * Math.exp(-0.1932605 * convert_minute)
  end
    
  # 走行速度[m/min]導出
  def calc_velocity
    self.running_distance * 1000 / convert_minute
  end
  
  # 酸素摂取量導出
  def vo2
    -4.6 + 0.182258 * calc_velocity + 0.000104 * calc_velocity ** 2
  end
  
  # 最大酸素摂取量
  def vdot
    vo2 / vdot_percent
  end
  
  # METS
  def mets
    vo2 / 3.5
  end
    
  # 消費カロリー
  def calc_calorie
    self.user.weight.present? ? mets * self.user.weight * convert_minute / 60 * 1.05 : nil
  end

  # 強度がE/M/Tのときランニング本数は1固定
  def freq_limit
    self.update(freq: 1) if judge_intensity(self)
  end

  #強度がE//M/Tかどうか判定
  def judge_intensity(record)
    record.intensity == 'E'|| record.intensity == 'M'|| record.intensity == 'T'
  end
  
end
