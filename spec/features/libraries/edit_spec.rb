require 'rails_helper'

RSpec.describe 'library edit form', type: :feature do
  before :each do
    @library = Library.create!(name: "Denver Central", staff_count: 35, member_count: 5000, open: true, created_at: DateTime.new(2019,2,3,4,5,6))

    visit "/libraries/#{@library.id}/edit"
  end

  it 'has a form to update a library' do
    expect(page).to have_field('name', :with => @library.name)
    expect(page).to have_field('staff_count', :with => @library.staff_count)
    expect(page).to have_field('member_count', :with => @library.member_count)
    expect(page).to have_field('open', :with => @library.open)
  end

  it 'creates a patch request with information entered to form' do
    fill_in 'name', with: 'Cherry Creek'
    click_button 'Update Library'

    expect(page).to have_current_path("/libraries/#{@library.id}")
    expect(page).to have_content('Cherry Creek')
  end
end
