require 'rails_helper'

RSpec.describe Mechanic, type: :model do
  describe 'relationships' do
    it { should have_many :repairs}
    it { should have_many(:rides).through(:repairs)}
  end

  describe 'instance methods' do
    it 'sorted_rides' do
      park = Park.create!(name: "Jurassic Park", admission_price: 500)
      ride_1 = park.rides.create!(name: "T-rex Race", rating: 4)
      ride_2 = park.rides.create!(name: "Raptor Race", rating: 8)
      ride_3 = park.rides.create!(name: "Megladon Swim", rating: 10)
      mechanic_1 = Mechanic.create!(name: "Hank", experience: 10)

      mechanic_1.rides << ride_1
      mechanic_1.rides << ride_2

      expect(mechanic_1.sorted_rides).to eq([ride_2, ride_1])
    end
  end
end
