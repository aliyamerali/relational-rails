require 'rails_helper'

RSpec.describe 'libraries new page and create functionality', type: :feature do

  it 'has a form to create a new library' do
    visit '/libraries/new'
    expect(page).to have_field('name')
    expect(page).to have_field('staff_count')
    expect(page).to have_field('member_count')
    expect(page).to have_field('open')
  end

  it 'creates a new library based on submission' do
    visit '/libraries/new'
    fill_in 'name', with: 'Cherry Creek'
    fill_in 'staff_count', with: '18'
    fill_in 'member_count', with: '750'
    choose('open', {option: false})
    click_button 'submit'

    expect(page).to have_current_path('/libraries')
    expect(page).to have_content('Cherry Creek')
  end

end
