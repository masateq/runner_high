class RunningRecord < ApplicationRecord
  belongs_to :user

  validates :running_distance, numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 100 }, presence: true
  validates :running_hour, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 8 }, presence: true
  validates :running_minute, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 59 }, presence: true
  validates :running_second, numericality: { only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 59 }, presence: true
  validates :times, numericality: { only_integer: true, greater_than_or_equal_to: 1, less_than_or_equal_to: 100 }, presence: true

  enum intensity: { E: 0, M: 1, T: 2, I: 3, R: 4 }
  
end
