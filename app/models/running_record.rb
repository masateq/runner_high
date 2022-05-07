class RunningRecord < ApplicationRecord
  belongs_to :user

  validates :running_distance, numericality: { in: 0..100 }, presence: true
  validates :running_hour, numericality: { in: 0..8 }, presence: true
  validates :running_minute, numericality: { in: 0..59 }, presence: true
  validates :running_second, numericality: { in: 0..59 }, presence: true
  
  enum intensity: { E: 0, M: 1, T: 2, I: 3, R: 4 }
  
end
