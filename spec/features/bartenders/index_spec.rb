require 'rails_helper'

RSpec.describe 'Bartenders Index Page' do
  before :each do
    @bartender1 = Bartender.create!(name: "Steve", age: 32, on_vacation: false, city: "Denver")
    @bartender2 = Bartender.create!(name: "Jill", age: 27, on_vacation: true, city: "Baltimore")
    @bartender3 = Bartender.create!(name: "Aaron", age: 36, on_vacation: false, city: "Austin")

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
end
