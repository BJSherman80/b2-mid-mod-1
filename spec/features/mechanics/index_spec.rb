require 'rails_helper'
RSpec.describe 'Mechanics index page', type: :feature do
  it 'can header and mechanic name and experience' do
    mechanic_1 = Mechanic.create!(name: "Hank", experience: 10)
    mechanic_2 = Mechanic.create!(name: "Shila", experience: 12)

    visit '/mechanics'

    expect(page).to have_content("All Mechanics")

    within("#mechanic-#{mechanic_1.id}") do
      expect(page).to have_content(mechanic_1.name)
      expect(page).to have_content(mechanic_1.experience)
    end
    within("#mechanic-#{mechanic_2.id}") do
      expect(page).to have_content(mechanic_2.name)
      expect(page).to have_content(mechanic_2.experience)
    end
  end
end
