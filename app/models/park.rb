class Park < ApplicationRecord
  has_many :rides

  def average_thrill_rating
    rides.average(:rating).to_f
  end

end
