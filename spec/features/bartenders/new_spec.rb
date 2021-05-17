require 'rails_helper'

RSpec.describe 'Bartenders New Page' do
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

    visit '/bartenders/new'
  end

  it 'can create a new bartender' do
    expect(current_path).to eq("/bartenders/new")

    expect(page).to have_field("Name")
    expect(page).to have_field("Age")
    expect(page).to have_field("City")

    expect(page).to have_unchecked_field("On vacation")

    fill_in "Name", with: 'Charles'
    fill_in "Age", with: '26'
    fill_in "City", with: 'Boston'

    check 'On vacation'

    click_on "Create Bartender"

    expect(current_path).to eq("/bartenders")

    expect(page).to have_content("Charles")
    # can't test other attributes since US-1 only allows for names
    # can check params though
    # ask about this during check in
  end
end
