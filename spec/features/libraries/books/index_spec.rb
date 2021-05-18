require 'rails_helper'

RSpec.describe 'Library books index' do
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
  end

  it 'shows all the books at a given library' do
    visit "/libraries/#{@library1.id}/books"
    expect(page).to have_content(@book1.name)
    expect(page).to have_content(@book1.available)
    expect(page).to have_content(@book2.name)
    expect(page).to have_content(@book2.publish_year)
    expect(page).not_to have_content(@book3.name)

    visit "/libraries/#{@library2.id}/books"
    expect(page).to have_content(@book3.name)
    expect(page).to have_content(@book3.available)
    expect(page).to have_content(@book4.name)
    expect(page).to have_content(@book4.publish_year)
    expect(page).not_to have_content(@book6.name)
  end

  it 'has link to books and libraries indexes' do
    visit "/libraries/#{@library2.id}/books"

    expect(page).to have_link("Books Index", :href=>"/books")
    expect(page).to have_link("Libraries Index", :href=>"/libraries")
  end

  it 'has a link to create a new book' do
    visit "/libraries/#{@library2.id}/books"

    expect(page).to have_link("Create Book", :href=>"/libraries/#{@library2.id}/books/new")
  end

  it 'has a link to sort alphabetically' do
    visit "/libraries/#{@library1.id}/books"

    expect(@book1.name).to appear_before(@book2.name)
    expect(page).to have_link("Sort Books Alphabetically", :href=>"/libraries/#{@library1.id}/books?sort=alpha")

    click_link("Sort Books Alphabetically")
    expect(@book2.name).to appear_before(@book1.name)
  end

  it 'has a link to edit book next to each book' do
    visit "/libraries/#{@library1.id}/books"
    expect(page).to have_link("Edit Book", :href=>"/books/#{@book1.id}/edit")
    expect(page).to have_link("Edit Book", :href=>"/books/#{@book2.id}/edit")

    visit "/libraries/#{@library2.id}/books"
    expect(page).to have_link("Edit Book", :href=>"/books/#{@book3.id}/edit")
    expect(page).to have_link("Edit Book", :href=>"/books/#{@book4.id}/edit")

    visit "/libraries/#{@library3.id}/books"
    expect(page).to have_link("Edit Book", :href=>"/books/#{@book5.id}/edit")
    expect(page).to have_link("Edit Book", :href=>"/books/#{@book6.id}/edit")
  end

  it 'clicking edit book link directs to the books edit page' do
    visit "/libraries/#{@library1.id}/books"
    click_link("Edit Book", match: :first)

    expect(page).to have_current_path("/books/#{@book1.id}/edit")
  end

  it 'has a button to filter by books published after a given year' do
    visit "/libraries/#{@library1.id}/books"
    expect(page).to have_field('filter')

    fill_in 'filter', with: '2000'
    click_button 'Only return records with publish_year after this date'
    expect(page).to have_content('1Q84')
    expect(page).to_not have_content('Harry Potter and the Sorcerer\'s Stone')
  end

  it 'can sort alphabetically and filter by year at the same time' do
    @book7 = @library1.books.create!(name: "The Vanishing Half", publish_year: 2020, available: false)
    @book8 = @library1.books.create!(name: "On the Move: A Life", publish_year: 2015, available: true)

    visit "/libraries/#{@library1.id}/books"
    click_link("Sort Books Alphabetically")
    fill_in 'filter', with: '2000'
    click_button 'Only return records with publish_year after this date'

    expect(page).to have_content('1Q84')
    expect(page).to have_content('On the Move: A Life')
    expect(page).to have_content('The Vanishing Half')
    expect(page).to_not have_content('Harry Potter and the Sorcerer\'s Stone')

    expect(@book2.name).to appear_before(@book8.name)
    expect(@book8.name).to appear_before(@book7.name)
  end

  it 'has a link to delete book next to every book' do
    visit "/libraries/#{@library1.id}/books"
    expect(page).to have_link("Delete '#{@book1.name}'")
    expect(page).to have_link("Delete '#{@book2.name}'")

    click_link("Delete '#{@book2.name}'")
    expect(page).to have_current_path('/books')
    expect(page).to_not have_content(@book2.name)
    expect(page).to have_content(@book1.name)
  end
end
