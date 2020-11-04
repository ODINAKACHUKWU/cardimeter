class Item < ApplicationRecord
  has_many :votes, dependent: :destroy
  has_many :users, through: :votes
  belongs_to :poll

  validates :title, presence: true, message: 'Please enter an item to be added to this poll.'
  validates :poll_id, presence: true
end
