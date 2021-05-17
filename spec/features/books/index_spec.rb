require 'rails_helper'

RSpec.describe 'books index page', type: :feature do
  before :each do
    @library1 = Library.create!(name: "Denver Central", staff_count: 35, member_count: 5000, open: true)
    @library2 = Library.create!(name: "Ford-Warren", staff_count: 12, member_count: 1200, open: false)
    @library3 = Library.create!(name: "Park Hill", staff_count: 20, member_count: 2300, open: true)

    @book1 = @library1.books.create!(name: "Harry Potter and the Sorcerer's Stone", publish_year: 1998, available: true)
    @book2 = @library1.books.create!(name: "1Q84", publish_year: 2011, available: false)

    @book3 = @library2.books.create!(name: "On the Move: A Life", publish_year: 2015, available: true)
    @book4 = @library2.books.create!(name: "The Vanishing Half", publish_year: 2020, available: false)

    @book5 = @library3.books.create!(name: "I'm Just A Person", publish_year: 2016, available: true)
    @book6 = @library3.books.create!(name: "The Ocean at the End of the Lane", publish_year: 2013, available: false)

    visit "/books"
  end

  it 'shows all available books with attributes' do
    expect(page).to have_content(@book1.name)
    expect(page).to have_content(@book1.publish_year)
    expect(page).to have_content(@book1.available)

    expect(page).to have_content(@book3.name)
    expect(page).to have_content(@book3.publish_year)
    expect(page).to have_content(@book3.available)


    expect(page).to have_content(@book5.name)
    expect(page).to have_content(@book5.publish_year)
    expect(page).to have_content(@book5.available)
  end

  it 'has link to books and libraries indexes' do
    expect(page).to have_link("Books Index", :href=>"/books")
    expect(page).to have_link("Libraries Index", :href=>"/libraries")
  end

  it 'does not show unavailable books' do
    expect(page).to_not have_content(@book2.name)
    expect(page).to_not have_content(@book2.publish_year)
    expect(page).to_not have_content(@book2.available)

    expect(page).to_not have_content(@book4.name)
    expect(page).to_not have_content(@book4.publish_year)
    expect(page).to_not have_content(@book4.available)

    expect(page).to_not have_content(@book6.name)
    expect(page).to_not have_content(@book6.publish_year)
    expect(page).to_not have_content(@book6.available)
  end

  it 'shows a link next to each book to edit the book' do
    expect(page).to have_link("Edit Book", :href=>"books/#{@book1.id}/edit")
    expect(page).to have_link("Edit Book", :href=>"books/#{@book3.id}/edit")
    expect(page).to have_link("Edit Book", :href=>"books/#{@book5.id}/edit")
  end

  it 'clicking on the book edit link brings user to the edit page for that book' do
    click_link("Edit Book", match: :first)

    expect(page).to have_current_path("/books/#{@book1.id}/edit")
  end

  it 'has a link to delete book next to every book' do
    expect(page).to have_link("Delete '#{@book1.name}'")
    expect(page).to have_link("Delete '#{@book3.name}'")
    expect(page).to have_link("Delete '#{@book5.name}'")

    click_link("Delete '#{@book3.name}'")
    expect(page).to have_current_path('/books')
    expect(page).to_not have_content(@book3.name)
    expect(page).to have_content(@book1.name)
    expect(page).to have_content(@book5.name)
  end
end
