require 'rails_helper'

RSpec.describe 'libraries new page', type: :feature do

  it 'has a form to create a new library' do
    visit '/libraries/new'
    expect(page).to have_field('name')
    expect(page).to have_field('staff_count')
    expect(page).to have_field('member_count')
    expect(page).to have_field('open')
  end

end
