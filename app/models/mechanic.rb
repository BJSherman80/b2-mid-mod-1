class Mechanic < ApplicationRecord
  has_many :repairs
  has_many :rides, through: :repairs
end
