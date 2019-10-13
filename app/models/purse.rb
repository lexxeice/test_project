class Purse < ApplicationRecord
  belongs_to :user

  validates :balance, presence: true, :numericality => {:greater_than_or_equal_to => 0}

  validates :user_id, presence: true
end
