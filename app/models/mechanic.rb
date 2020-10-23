class Mechanic < ApplicationRecord
  has_many :repairs
  has_many :rides, through: :repairs

  def sorted_rides
    rides.order(name: :asc)
  end

end
