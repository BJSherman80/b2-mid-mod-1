require 'rails_helper'

RSpec.describe 'Park show page', type: :feature do
  it 'can see park name, price, rides and average thrill rating' do
    park = Park.create!(name: "Jurassic Park", admission_price: 500)
    ride_1 = park.rides.create!(name: "T-rex Race", rating: 4)
    ride_2 = park.rides.create!(name: "Raptor Race", rating: 8)
    ride_3 = park.rides.create!(name: "Megladon Swim", rating: 10)
    # park.rides << ride_1
    # park.rides << ride_2
    # park.rides << ride_3

    visit "/parks/#{park.id}"
    save_and_open_page
    expect(page).to have_content(park.name)
    expect(page).to have_content(park.admission_price)
    expect(page).to have_content(ride_1.name)
    expect(page).to have_content(ride_2.name)
    expect(page).to have_content(ride_3.name)
    expect(page).to have_content("Average Thrill Rating of Rides: #{park.average_thrill_rating}")
  end
end
