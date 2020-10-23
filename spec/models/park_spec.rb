require 'rails_helper'
RSpec.describe Park, type: :model do
  describe 'relationships' do
      it { should have_many :rides }
  end

  describe 'instance methods' do
    it "calculates average thrill rating"do
    park = Park.create!(name: "Jurassic Park", admission_price: 500)
    ride_1 = park.rides.create!(name: "T-rex Race", rating: 4)
    ride_2 = park.rides.create!(name: "Raptor Race", rating: 8)
    ride_3 = park.rides.create!(name: "Megladon Swim", rating: 10)

    expect((park.average_thrill_rating).round(2)).to eq(7.33)

  end
 end
end
