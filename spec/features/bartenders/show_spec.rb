require 'rails_helper'

RSpec.describe 'Bartenders show Page' do
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

    visit "/bartenders/#{@bartender1.id}"
  end

  it "I see the parent with that id including the parent's attributes" do
    expect(page).to have_content(@bartender1.name)
    expect(page).to have_content(@bartender1.on_vacation)
    expect(page).to have_content(@bartender1.city)

    expect(page).to_not have_content(@bartender2.name)
    expect(page).to_not have_content(@bartender2.on_vacation)
    expect(page).to_not have_content(@bartender2.city)
  end

  it "shows the count of the number of children associated with this parent" do
    within("#drink-count") do
      expect(@bartender1.drinks_count).to eq(2)

      expect(@bartender1.drinks_count).to_not eq(1)
    end
  end

  it "I see a link at the top of the page that takes me to the Child Index" do
    expect(page).to have_link("Drinks Home Page", href: "/drinks")
    expect(page).to have_link("Bartenders Home Page", href: "/bartenders")
    expect(page).to have_link("Libraries Index", href: "/libraries")
    expect(page).to have_link("Books Index", href: "/books")
  end

  it "I see a link to take me to that parent's `child_table_name` page" do
    expect(page).to have_link('Drinks for this Bartender', href: "/bartenders/#{@bartender1.id}/drinks")
  end
end
