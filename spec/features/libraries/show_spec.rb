require 'rails_helper'

RSpec.describe 'libraries show page', type: :feature do

  it 'shows the library and attributes with given id' do
    library1 = Library.create!(name: "Denver Central", staff_count: 35, member_count: 5000, open: true)
    library2 = Library.create!(name: "Ford-Warren", staff_count: 12, member_count: 1200, open: false)
    library3 = Library.create!(name: "Park Hill", staff_count: 20, member_count: 2300, open: true)

    visit "/libraries/#{library1.id}"
    expect(page).to have_content(library1.name)
    expect(page).to have_content(library1.staff_count)
    expect(page).to have_content(library1.member_count)
    expect(page).to have_content(library1.open)

    visit "/libraries/#{library2.id}"
    expect(page).to have_content(library2.name)
    expect(page).to have_content(library2.staff_count)
    expect(page).to have_content(library2.member_count)
    expect(page).to have_content(library2.open)

    visit "/libraries/#{library3.id}"
    expect(page).to have_content(library3.name)
    expect(page).to have_content(library3.staff_count)
    expect(page).to have_content(library3.member_count)
    expect(page).to have_content(library3.open)
  end

end
