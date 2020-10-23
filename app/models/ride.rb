class Ride < ApplicationRecord
  belongs_to :park
  has_many :repairs
  has_many :mechanics, through: :repairs
end
