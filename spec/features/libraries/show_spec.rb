require 'rails_helper'

RSpec.describe 'libraries show page', type: :feature do
  before :each do
    @library1 = Library.create!(name: "Denver Central", staff_count: 35, member_count: 5000, open: true)
    @library2 = Library.create!(name: "Ford-Warren", staff_count: 12, member_count: 1200, open: false)
    @library3 = Library.create!(name: "Park Hill", staff_count: 20, member_count: 2300, open: true)

    @book1 = @library1.books.create!(name: "Harry Potter and the Sorcerer's Stone", publish_year: 1998, available: true)
    @book2 = @library1.books.create!(name: "1Q84", publish_year: 2011, available: false)
    @book5 = @library1.books.create!(name: "I'm Just A Person", publish_year: 2016, available: true)

    @book3 = @library2.books.create!(name: "On the Move: A Life", publish_year: 2015, available: true)
    @book4 = @library2.books.create!(name: "The Vanishing Half", publish_year: 2020, available: false)

    @book6 = @library3.books.create!(name: "The Ocean at the End of the Lane", publish_year: 2013, available: false)

  end

  it 'shows the library and attributes with given id' do

    visit "/libraries/#{@library1.id}"
    expect(page).to have_content(@library1.name)
    expect(page).to have_content(@library1.staff_count)
    expect(page).to have_content(@library1.member_count)
    expect(page).to have_content(@library1.open)

    visit "/libraries/#{@library2.id}"
    expect(page).to have_content(@library2.name)
    expect(page).to have_content(@library2.staff_count)
    expect(page).to have_content(@library2.member_count)
    expect(page).to have_content(@library2.open)

    visit "/libraries/#{@library3.id}"
    expect(page).to have_content(@library3.name)
    expect(page).to have_content(@library3.staff_count)
    expect(page).to have_content(@library3.member_count)
    expect(page).to have_content(@library3.open)
  end

  it 'shows the total count of books at the library' do
    visit "/libraries/#{@library1.id}"
    expect(page).to have_content("Total Book Count: 3")

    visit "/libraries/#{@library2.id}"
    expect(page).to have_content("Total Book Count: 2")

    visit "/libraries/#{@library3.id}"
    expect(page).to have_content("Total Book Count: 1")
  end

  it 'has link to books index' do
    visit "/libraries/#{@library1.id}"
    expect(page).to have_link("Books Index", :href=>"/books")
  end

end
