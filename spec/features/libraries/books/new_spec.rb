require 'rails_helper'

RSpec.describe 'add a new book to a given library' do
  it 'has a form to create a new book' do
    @library = Library.create!(name: "Denver Central", staff_count: 35, member_count: 5000, open: true)
    visit "/libraries/#{@library.id}/books/new"

    expect(page).to have_field('name')
    expect(page).to have_field('publish_year')
    expect(page).to have_field('available')
  end

  it 'clicking submit redirects back to the library book page that shows the new book' do
    @library = Library.create!(name: "Denver Central", staff_count: 35, member_count: 5000, open: true)
    visit "/libraries/#{@library.id}/books/new"
    fill_in 'name', with: 'Brave New Work'
    fill_in 'publish_year', with: '2019'
    choose('available', {option: true})
    click_button 'Create Book'

    expect(page).to have_current_path("/libraries/#{@library.id}/books")
    expect(page).to have_content("Brave New Work")
    expect(page).to have_content("Year Published: 2019")
    expect(page).to have_content("Currently Available: true")
  end

  it 'creates a book that also shows on the books index page' do
    @library = Library.create!(name: "Denver Central", staff_count: 35, member_count: 5000, open: true)
    visit "/libraries/#{@library.id}/books/new"
    fill_in 'name', with: 'Brave New Work'
    fill_in 'publish_year', with: '2019'
    choose('available', {option: true})
    click_button 'Create Book'

    visit "/books"
    expect(page).to have_content("Brave New Work")
    expect(page).to have_content("Year Published: 2019")
    expect(page).to have_content("Currently Available: true")
  end
end
