require 'rails_helper'

RSpec.describe 'libraries index page', type: :feature do

  it 'shows all library names' do
    library1 = Library.create!(name: "Denver Central", staff_count: 35, member_count: 5000, open: true)
    library2 = Library.create!(name: "Ford-Warren", staff_count: 12, member_count: 1200, open: false)
    library3 = Library.create!(name: "Park Hill", staff_count: 20, member_count: 2300, open: true)

    expect(page).to have_content(library1.name)
    expect(page).to have_content(library2.name)
    expect(page).to have_content(library3.name)
    expect(page).to_not have_content(library1.open)
  end


end
