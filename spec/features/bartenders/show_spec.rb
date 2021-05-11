require 'rails_helper'

RSpec.describe 'Bartenders show Page' do
  before :each do
    @bartender1 = Bartender.create!(name: "Steve", age: 32, on_vacation: false, city: "Denver")
    @bartender2 = Bartender.create!(name: "Jill", age: 27, on_vacation: true, city: "Baltimore")
    @bartender3 = Bartender.create!(name: "Aaron", age: 36, on_vacation: false, city: "Austin")

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
end
