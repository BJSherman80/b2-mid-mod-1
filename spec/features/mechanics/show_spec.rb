require 'rails_helper'

RSpec.describe 'Mechanic show page', type: :feature do
  it 'can see mechanic name, experience, rides they are working on' do
    park = Park.create!(name: "Jurassic Park", admission_price: 500)
    ride_1 = park.rides.create!(name: "T-rex Race", rating: 4)
    ride_2 = park.rides.create!(name: "Raptor Race", rating: 8)
    ride_3 = park.rides.create!(name: "Megladon Swim", rating: 10)
    mechanic_1 = Mechanic.create!(name: "Hank", experience: 10)
    mechanic_1.rides << ride_1
    mechanic_1.rides << ride_2

    visit "/mechanics/#{mechanic_1.id}"

    expect(page).to have_content(mechanic_1.name)
    expect(page).to have_content(mechanic_1.experience)
    expect(page).to have_content(ride_1.name)
    expect(page).to have_content(ride_2.name)
    expect(ride_2.name).to appear_before(ride_1.name)
   end

  it 'can add a ride to the mechanics list ' do
    park = Park.create!(name: "Jurassic Park", admission_price: 500)
    ride_1 = park.rides.create!(name: "T-rex Race", rating: 4)
    ride_2 = park.rides.create!(name: "Raptor Race", rating: 8)
    ride_3 = park.rides.create!(name: "Megladon Swim", rating: 10)
    mechanic_1 = Mechanic.create!(name: "Hank", experience: 10)

    mechanic_1.rides << ride_1
    mechanic_1.rides << ride_2

    visit "/mechanics/#{mechanic_1.id}"
    fill_in :ride_id, with: "#{ride_3.id}"
    click_button 'Submit'
    expect(page).to have_content(ride_3.name)
  end

  it 'can flash message for a ride that doesnt exist ' do
    park = Park.create!(name: "Jurassic Park", admission_price: 500)
    ride_1 = park.rides.create!(name: "T-rex Race", rating: 4)
    ride_2 = park.rides.create!(name: "Raptor Race", rating: 8)
    ride_3 = park.rides.create!(name: "Megladon Swim", rating: 10)
    mechanic_1 = Mechanic.create!(name: "Hank", experience: 10)

    mechanic_1.rides << ride_1
    mechanic_1.rides << ride_2

    visit "/mechanics/#{mechanic_1.id}"
    fill_in :ride_id, with: "67988"
    click_button 'Submit'
    expect(page).to have_content('Ride does not exist.')
  end
end
