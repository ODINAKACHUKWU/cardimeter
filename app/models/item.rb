class Item < ApplicationRecord
  has_many :votes, dependent: :destroy
  has_many :users, through: :votes
  belongs_to :poll

  validates :title, presence: true
  validates :poll_id, presence: true
end
