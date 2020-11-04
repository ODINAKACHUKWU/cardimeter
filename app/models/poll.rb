class Poll < ApplicationRecord
  has_many :items, dependent: :destroy
  belongs_to :company

  validates :title, presence: true
  validates :company_id, presence: true

  def open?
    status
  end
end
