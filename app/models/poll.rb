class Poll < ApplicationRecord
  has_many :items
  belongs_to :company
end
