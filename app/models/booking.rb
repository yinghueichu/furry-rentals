class Booking < ApplicationRecord
  belongs_to :animal
  belongs_to :user
  has_one :review
  validates :start_date, :end_date, :animal, presence: true
  validates_numericality_of :end_date, greater_than: :start_date
end
