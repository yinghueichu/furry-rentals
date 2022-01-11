class Animal < ApplicationRecord
  belongs_to :user
  validates :name, :species, :address, presence: :true
end
