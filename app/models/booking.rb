class Booking < ApplicationRecord
  belongs_to :animal
  belongs_to :user
  validates :start_date, :animal, presence: true
end
