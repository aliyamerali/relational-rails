require 'rails_helper'

RSpec.describe 'Book Show page', type: :feature do

  it 'shows a book and all attributes for a given id' do
    library1 = Library.create!(name: "Denver Central", staff_count: 35, member_count: 5000, open: true)
    library2 = Library.create!(name: "Ford-Warren", staff_count: 12, member_count: 1200, open: false)

    book1 = library1.books.create!(name: "Harry Potter and the Sorcerer's Stone", publish_year: 1998, available: true)
    book2 = library2.books.create!(name: "1Q84", publish_year: 2011, available: false)

    visit "/books/#{book1.id}"

    expect(page).to have_content(book1.name)
    expect(page).to have_content(book1.publish_year)
    expect(page).to have_content(book1.available)
    expect(page).to have_content(book1.library_id)

    visit "/books/#{book2.id}"

    expect(page).to have_content(book2.name)
    expect(page).to have_content(book2.publish_year)
    expect(page).to have_content(book2.available)
    expect(page).to have_content(book2.library_id)
  end
end
