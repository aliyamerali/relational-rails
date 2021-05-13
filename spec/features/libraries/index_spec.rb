require 'rails_helper'

RSpec.describe 'libraries index page', type: :feature do
  before :each do
    @library1 = Library.create!(name: "Denver Central", staff_count: 35, member_count: 5000, open: true, created_at: DateTime.new(2019,2,3,4,5,6))
    @library2 = Library.create!(name: "Ford-Warren", staff_count: 12, member_count: 1200, open: false, created_at: DateTime.new(2020,2,3,4,5,6))
    @library3 = Library.create!(name: "Park Hill", staff_count: 20, member_count: 2300, open: true, created_at: DateTime.new(2021,2,3,4,5,6))

    visit "/libraries"
  end

  it 'shows all library names' do
    expect(page).to have_content(@library1.name)
    expect(page).to have_content(@library2.name)
    expect(page).to have_content(@library3.name)
    expect(page).to_not have_content(@library1.open)
  end

  it 'returns libraries in order of creation, with most recently created first' do
    save_and_open_page
    expect(@library3.name).to appear_before(@library2.name)
    expect(@library2.name).to appear_before(@library1.name)
  end

  it 'shows when each record was created' do
    expect(page).to have_content(@library1.created_at)
    expect(page).to have_content(@library2.created_at)
    expect(page).to have_content(@library3.created_at)
    expect(page).to_not have_content(@library3.updated_at)
  end
end
