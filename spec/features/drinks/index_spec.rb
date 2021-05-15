require 'rails_helper'

RSpec.describe 'Drinks Index Page' do
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

    visit "/drinks"
  end

  it "I see each Child in the system including the Child's attributes" do
    within("#drink-#{@drink1.id}") do
      expect(page).to have_content(@drink1.name)
      expect(page).to have_content(@drink1.cost)
      expect(page).to have_content(@drink1.abv)
      expect(page).to have_content(@drink1.popular)
    end

    within("#drink-#{@drink2.id}") do
      expect(page).to have_content(@drink2.name)
      expect(page).to have_content(@drink2.cost)
      expect(page).to have_content(@drink2.abv)
      expect(page).to have_content(@drink2.popular)
    end

    within("#drink-#{@drink3.id}") do
      expect(page).to have_content(@drink3.name)
      expect(page).to have_content(@drink3.cost)
      expect(page).to have_content(@drink3.abv)
      expect(page).to have_content(@drink3.popular)
    end

    within("#drink-#{@drink4.id}") do
      expect(page).to have_content(@drink4.name)
      expect(page).to have_content(@drink4.cost)
      expect(page).to have_content(@drink4.abv)
      expect(page).to have_content(@drink4.popular)
    end

    within("#drink-#{@drink5.id}") do
      expect(page).to have_content(@drink5.name)
      expect(page).to have_content(@drink5.cost)
      expect(page).to have_content(@drink5.abv)
      expect(page).to have_content(@drink5.popular)
    end

    within("#drink-#{@drink6.id}") do
      expect(page).to have_content(@drink6.name)
      expect(page).to have_content(@drink6.cost)
      expect(page).to have_content(@drink6.abv)
      expect(page).to have_content(@drink6.popular)
    end
  end

  it "I see a link at the top of the page that takes me to the Child Index" do
    expect(page).to have_link("Drinks Home Page", href: "/drinks")
    expect(page).to have_link("Bartenders Home Page", href: "/bartenders")
    expect(page).to have_link("Libraries Index", href: "/libraries")
    expect(page).to have_link("Books Index", href: "/books")
  end
end
