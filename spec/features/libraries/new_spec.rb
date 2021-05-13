require 'rails_helper'

RSpec.describe 'libraries new page', type: :feature do

  it 'has a form to create a new library' do
    expect(page).to have_field("Library Name")
    expect(page).to have_field("Library Staff Count")
    expect(page).to have_field("Library Member Count")
    expect(page).to have_field("Is this library open?")
  end

end
