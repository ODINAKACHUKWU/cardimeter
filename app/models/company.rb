class Company < ApplicationRecord
  has_many :polls, dependent: :destroy
  has_many :shares, dependent: :destroy
  has_many :users, through: :shares

  validates :name, presence: true, uniqueness: true
end
