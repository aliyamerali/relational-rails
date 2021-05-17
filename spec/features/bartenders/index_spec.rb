require 'rails_helper'

RSpec.describe 'Bartenders Index Page' do
  before :each do
    @bartender1 = Bartender.create!(name: "Steve", age: 32, on_vacation: false, city: "Denver", created_at: "2021-03-26 15:10:42")
    @bartender2 = Bartender.create!(name: "Jill", age: 27, on_vacation: true, city: "Baltimore", created_at: "2021-03-24 10:10:42")
    @bartender3 = Bartender.create!(name: "Aaron", age: 36, on_vacation: false, city: "Austin", created_at: "2021-03-28 20:10:42")

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

  it "I see a link to create a new Bartender" do
    expect(page).to have_link("New Bartender", href: "/bartenders/new")
  end
end
