class TrainingSuggestion < ApplicationRecord
  belongs_to :user
  enum intensity: { E: 0, M: 1, T: 2, I: 3, R: 4 }
end
