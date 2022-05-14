class TrainingSuggestion < ApplicationRecord
  belongs_to :user
  enum intensity: { E: 0, M: 1, T: 2, I: 3, R: 4 }

  def percent
    case self.intensity.to_f
    when 0
      0.66
    when 1
      0.815
    when 2
      0.875
    when 3
      97.5
    when 4
      107
    end
  end

  def pace
    vdot = self.user.vdot * percent
    vel = 29.54 + 5.000663 * vdot - 0.007546 * vdot ** 2
    time = 1000 / vel
    min = time.to_i
    sec = ((time - min) * 60).to_i
    "#{min}:#{sec} / km"
  end

  def pace_time
    vdot = self.user.vdot * percent
    vel = 29.54 + 5.000663 * vdot - 0.007546 * vdot ** 2
    time = (1000 / vel) * self.running_distance
    hour = (time / 60).floor.to_i
    min = (time - hour * 60).to_i
    sec = ((time - hour * 60 - min) * 60).to_i
    "#{hour}:#{min}:#{sec}"
  end

  def calorie
    vdot = self.user.vdot * percent
    vel = 29.54 + 5.000663 * vdot - 0.007546 * vdot ** 2
    time = (1000 / vel) * self.running_distance
    mets = vdot / 3.5
    cal = (self.user.weight.present? ? mets * self.user.weight * time / 60 * 1.05 : nil).to_i
    "#{cal} kcal"
  end

end
