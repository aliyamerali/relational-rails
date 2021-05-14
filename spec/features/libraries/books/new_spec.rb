require 'rails_helper'

RSpec.describe 'form to add a new book to a given library' do
  it 'has a form to create a new book' do
    @library = Library.create!(name: "Denver Central", staff_count: 35, member_count: 5000, open: true)
    visit "/libraries/#{@library.id}/books.new"

    expect(page).to have_field('name')
    expect(page).to have_field('publish_year')
    expect(page).to have_field('available')
  end
end
