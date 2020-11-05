class Vote < ApplicationRecord
  belongs_to :item
  belongs_to :user

  validates :item_id, presence: true
  validates :user_id, presence: true
  validates :poll_id, presence: true

  before_save :estimate_counts

  private

  def estimate_counts
    company_id = Poll.find(poll_id).company.id
    shares = Share.where(company_id: company_id, user_id: user_id).first.units
    self.counts = shares
  end
end
