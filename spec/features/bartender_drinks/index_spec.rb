require 'rails_helper'

RSpec.describe 'Bartender Drinks Index Page' do
  before :each do
    @bartender1 = Bartender.create!(name: "Steve", age: 32, on_vacation: false, city: "Denver")
    @bartender2 = Bartender.create!(name: "Jill", age: 27, on_vacation: true, city: "Baltimore")
    @bartender3 = Bartender.create!(name: "Aaron", age: 36, on_vacation: false, city: "Austin")

    @drink1 = @bartender1.drinks.create!(name: "Martini", cost: 4.00, abv: 11, popular: true)
    @drink2 = @bartender1.drinks.create!(name: "4 horsmen", cost: 11.00, abv: 18, popular: false)
    @drink7 = @bartender1.drinks.create!(name: "Manhatten", cost: 12.00, abv: 15, popular: true)

    @drink3 = @bartender2.drinks.create!(name: "Mojito", cost: 7.00, abv: 10, popular: true)
    @drink4 = @bartender2.drinks.create!(name: "Mai Tai", cost: 9.00, abv: 13, popular: true)

    @drink5 = @bartender3.drinks.create!(name: "Hurricane", cost: 6.00, abv: 5, popular: false)
    @drink6 = @bartender3.drinks.create!(name: "Gin and Tonic", cost: 7.00, abv: 9, popular: true)

    visit "/bartenders/#{@bartender1.id}/drinks"
  end

  it "I see each Child that is associated with that Parent with each Child's attributes" do
    expect(page).to have_content(@drink1.name)
    expect(page).to have_content(@drink1.cost)
    expect(page).to have_content(@drink1.abv)
    expect(page).to have_content(@drink1.popular)

    expect(page).to have_content(@drink2.name)
    expect(page).to have_content(@drink2.cost)
    expect(page).to have_content(@drink2.abv)
    expect(page).to have_content(@drink2.popular)

    expect(page).to_not have_content(@drink3.name)
    expect(page).to_not have_content(@drink3.cost)
    expect(page).to_not have_content(@drink3.abv)
  end

  it "I see a link at the top of the page that takes me to the Child Index" do
    expect(page).to have_link("Drinks Home Page", href: "/drinks")
    expect(page).to have_link("Bartenders Home Page", href: "/bartenders")
    expect(page).to have_link("Libraries Index", href: "/libraries")
    expect(page).to have_link("Books Index", href: "/books")
  end

  it "I see a link to add a new drink for this bartender" do
    expect(page).to have_link("Create Drink", href: "/bartenders/#{@bartender1.id}/drinks/new")
  end

  it "I see a link to sort drinks alphabetically" do
    expect(page).to have_link("Sort Drinks", href: "/bartenders/#{@bartender1.id}/drinks?sort=alphabetical")
  end

  it "I see an edit link next to each drink" do
    expect(page).to have_link("Edit", href: "/drinks/#{@drink1.id}/edit")
  end

  it "When I click the edit button next to each drink it takes me to the edit page" do
    expect(current_path).to eq("/bartenders/#{@bartender1.id}/drinks")

    within("#bartender-drink-#{@drink1.id}") do
      click_link "Edit"
    end

    expect(current_path).to eq("/drinks/#{@drink1.id}/edit")
  end

  it "I see a form that allows me to input a number value and when I click submit only the records that meet that threshold are shown" do
    expect(current_path).to eq("/bartenders/#{@bartender1.id}/drinks")
    
    expect(page).to have_field("filter")

    fill_in 'filter', with: '13'
    click_button "Only return records with more than number submitted of abv"

    expect(page).to have_content(@drink2.name)
    expect(page).to have_content(@drink2.cost)
    expect(page).to have_content(@drink2.abv)
    expect(page).to have_content(@drink2.popular)

    expect(page).to have_content(@drink7.name)
    expect(page).to have_content(@drink7.cost)
    expect(page).to have_content(@drink7.abv)
    expect(page).to have_content(@drink7.popular)

    expect(page).to_not have_content(@drink1.name)
    expect(page).to_not have_content(@drink1.cost)
  end
end
