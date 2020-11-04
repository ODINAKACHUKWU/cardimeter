class Company < ApplicationRecord
  has_many :polls
  has_many :shares
  has_many :users, through: :shares
end
