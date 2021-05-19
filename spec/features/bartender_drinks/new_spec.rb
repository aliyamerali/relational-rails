require 'rails_helper'

RSpec.describe 'Bartenders Drinks New Page' do
  before :each do
    @bartender1 = Bartender.create!(name: "Steve", age: 32, on_vacation: false, city: "Denver")
    @bartender2 = Bartender.create!(name: "Jill", age: 27, on_vacation: true, city: "Baltimore")
    @bartender3 = Bartender.create!(name: "Aaron", age: 36, on_vacation: false, city: "Austin")

    @drink1 = @bartender1.drinks.create!(name: "Martini", cost: 4.00, abv: 11, popular: true)
    @drink2 = @bartender1.drinks.create!(name: "4 horsmen", cost: 11.00, abv: 18, popular: false)

    @drink3 = @bartender2.drinks.create!(name: "Mojito", cost: 7.00, abv: 10, popular: true)
    @drink4 = @bartender2.drinks.create!(name: "Mai Tai", cost: 9.00, abv: 13, popular: true)

    @drink5 = @bartender3.drinks.create!(name: "Hurricane", cost: 6.00, abv: 5, popular: false)
    @drink6 = @bartender3.drinks.create!(name: "Gin and Tonic", cost: 7.00, abv: 9, popular: true)

    visit "/bartenders/#{@bartender1.id}/drinks/new"
  end

  it 'I can add a new drink for this bartender' do
    expect(current_path).to eq("/bartenders/#{@bartender1.id}/drinks/new")

    expect(page).to have_field("Name")
    expect(page).to have_field("Cost")
    expect(page).to have_field("Abv")

    expect(page).to have_unchecked_field("Popular")

    fill_in "Name", with: 'Screw Driver'
    fill_in "Cost", with: '3.0'
    fill_in "Abv", with: '13'

    check 'Popular'

    click_on "Create Drink"

    expect(current_path).to eq("/bartenders/#{@bartender1.id}/drinks")

    expect(page).to have_content("Screw Driver")
    expect(page).to have_content("$3.00")
    expect(page).to have_content(13)
    expect(page).to have_content("Popular ? true")
  end
end
