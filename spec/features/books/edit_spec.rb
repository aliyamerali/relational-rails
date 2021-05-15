require 'rails_helper'

RSpec.describe 'Book Edit page', type: :feature do
  before :each do
    @library = Library.create!(name: "Denver Central", staff_count: 35, member_count: 5000, open: true)
    @book = @library.books.create!(name: "Harry Potter and the Sorcerer's Stone", publish_year: 1998, available: true)

    visit "/books/#{@book.id}/edit"
  end

  it 'has a form to update the book' do
    expect(page).to have_field('name', :with => @book.name)
    expect(page).to have_field('publish_year', :with => @book.publish_year)
    expect(page).to have_field('available', :with => @book.available)
  end


  it 'updates the book info with information entered to form' do
    fill_in 'name', with: 'Harry Potter and the Philosopher\'s Stone'
    choose('available', {option: false})
    click_button 'submit'

    expect(page).to have_current_path("/books/#{@book.id}")
    expect(page).to have_content('Harry Potter and the Philosopher\'s Stone')
  end

end
