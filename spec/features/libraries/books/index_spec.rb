require 'rails_helper'

RSpec.describe 'Library books index' do

  it 'shows all the books at a given library' do
    library1 = Library.create!(name: "Denver Central", staff_count: 35, member_count: 5000, open: true)
    library2 = Library.create!(name: "Ford-Warren", staff_count: 12, member_count: 1200, open: false)
    library3 = Library.create!(name: "Park Hill", staff_count: 20, member_count: 2300, open: true)

    book1 = library1.books.create!(name: "Harry Potter and the Sorcerer's Stone", publish_year: 1998, available: true)
    book2 = library1.books.create!(name: "1Q84", publish_year: 2011, available: false)

    book3 = library2.books.create!(name: "On the Move: A Life", publish_year: 2015, available: true)
    book4 = library2.books.create!(name: "The Vanishing Half", publish_year: 2020, available: false)

    book5 = library3.books.create!(name: "I'm Just A Person", publish_year: 2016, available: true)
    book6 = library3.books.create!(name: "The Ocean at the End of the Lane", publish_year: 2013, available: false)

    visit "/libraries/#{library1.id}/books"
    expect(page).to have_content(book1.name)
    expect(page).to have_content(book1.available)
    expect(page).to have_content(book2.name)
    expect(page).to have_content(book2.publish_year)
    expect(page).not_to have_content(book3.name)
  end

end