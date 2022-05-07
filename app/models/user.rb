class User < ApplicationRecord
  authenticates_with_sorcery!
  has_many :running_records
  has_many :training_suggestions

  validates :password, length: { minimum: 3 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }

  validates :email, uniqueness: true, presence: true
  validates :name, presence: true, length: { maximum: 30 }

  enum sex: { not_specified: 0, male: 1, female: 2 }
end
