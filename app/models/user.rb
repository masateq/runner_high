class User < ApplicationRecord
  has_many :running_records
  has_many :training_suggestions

end
