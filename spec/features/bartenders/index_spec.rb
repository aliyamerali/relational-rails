require 'rails_helper'

RSpec.describe 'Bartenders Index Page' do
  before :each do
    @bartender1 = Bartender.create!(name: "Steve", age: 32, on_vacation: false, city: "Denver", created_at: "2021-03-26 15:10:42")
    @bartender2 = Bartender.create!(name: "Jill", age: 27, on_vacation: true, city: "Baltimore", created_at: "2021-03-24 10:10:42")
    @bartender3 = Bartender.create!(name: "Aaron", age: 36, on_vacation: false, city: "Austin", created_at: "2021-03-28 20:10:42")

    @drink1 = @bartender1.drinks.create!(name: "Martini", cost: 4.00, abv: 11, popular: true)

    @drink2 = @bartender2.drinks.create!(name: "4 horsmen", cost: 11.00, abv: 18, popular: false)
    @drink3 = @bartender2.drinks.create!(name: "Mojito", cost: 7.00, abv: 10, popular: true)
    @drink4 = @bartender2.drinks.create!(name: "Mai Tai", cost: 9.00, abv: 13, popular: true)

    @drink5 = @bartender3.drinks.create!(name: "Hurricane", cost: 6.00, abv: 5, popular: false)
    @drink6 = @bartender3.drinks.create!(name: "Gin and Tonic", cost: 7.00, abv: 9, popular: true)

    visit "/bartenders"
  end

  it 'I see the name of each parent record in the system' do

    within("#bartender-#{@bartender1.id}") do
      expect(page).to have_content(@bartender1.name)
    end

    within("#bartender-#{@bartender2.id}") do
      expect(page).to have_content(@bartender2.name)
    end

    within("#bartender-#{@bartender3.id}") do
      expect(page).to have_content(@bartender3.name)
    end
  end

  it "I see that bartenders are ordered by most recently created first(started on)
And next to each of the bartenders I see when it was created" do
    expect(@bartender3.name).to appear_before(@bartender2.name)
  end

  it "I see a link at the top of the page that takes me to the Child Index" do
    expect(page).to have_link("Drinks Home Page", href: "/drinks")
    expect(page).to have_link("Bartenders Home Page", href: "/bartenders")
    expect(page).to have_link("Libraries Index", href: "/libraries")
    expect(page).to have_link("Books Index", href: "/books")
  end

  it "I see a link to create a new bartender" do
    expect(page).to have_link("New Bartender", href: "/bartenders/new")
  end

  it "Next to every bartender, I see a link to edit that bartenders info" do
    expect(page).to have_link("Edit", href: "/bartenders/#{@bartender1.id}/edit")
  end

  it "When I click the edit button next to each bartender it takes me to the edit page" do
    expect(current_path).to eq("/bartenders")

    within("#bartender-#{@bartender1.id}") do
      click_link "Edit"
    end

    expect(current_path).to eq("/bartenders/#{@bartender1.id}/edit")
  end

  it "I see a link to delete each bartender" do
    expect(page).to have_link("Delete Bartender", href: "/bartenders/#{@bartender1.id}")
  end

  it "I can delete a bartender from the index page" do
    expect(current_path).to eq("/bartenders")
    expect(page).to have_content(@bartender1.name)

    within("#bartender-#{@bartender1.id}") do
      click_link "Delete Bartender"
    end

    expect(current_path).to eq("/bartenders")
    expect(page).to_not have_content(@bartender1.name)
  end

  it "If I click the 'Sort by Drink count' link then the bartenders are ordered and their drink count next to them" do
    expect(current_path).to eq("/bartenders")
    expect(page).to_not have_content('Drink Count')

    click_link 'Sort by Drink count'

    expect(@bartender2.name).to appear_before(@bartender1.name)
    expect(page).to have_content('Drink Count')
    expect(current_path).to eq("/bartenders")
  end

  it "I can see a for to 'filter results by keyword'" do
    expect(page).to have_field('filter')
  end
end
