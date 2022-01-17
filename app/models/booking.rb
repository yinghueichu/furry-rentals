class Booking < ApplicationRecord
  belongs_to :animal
  belongs_to :user
  has_one :review
  validates :start_date, :animal, presence: true
end
