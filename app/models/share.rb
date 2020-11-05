class Share < ApplicationRecord
  belongs_to :company
  belongs_to :user

  validates :units, presence: true, numericality: { only_integer: true, message: "Only accepts integers." }
  validates :company_id, presence: true
  validates :user_id, presence: true
end
