require 'rails_helper'

RSpec.describe 'libraries index page', type: :feature do
  before :each do
    @library1 = Library.create!(name: "Denver Central", staff_count: 35, member_count: 5000, open: true, created_at: DateTime.new(2019,2,3,4,5,6))
    @library2 = Library.create!(name: "Ford-Warren", staff_count: 12, member_count: 1200, open: false, created_at: DateTime.new(2020,2,3,4,5,6))
    @library3 = Library.create!(name: "Park Hill", staff_count: 20, member_count: 2300, open: true, created_at: DateTime.new(2021,2,3,4,5,6))

    visit "/libraries"
  end

  it 'shows all library names' do
    expect(page).to have_content(@library1.name)
    expect(page).to have_content(@library2.name)
    expect(page).to have_content(@library3.name)
    expect(page).to_not have_content(@library1.open)
  end

  it 'returns libraries in order of creation, with most recently created first' do
    expect(@library3.name).to appear_before(@library2.name)
    expect(@library2.name).to appear_before(@library1.name)
  end

  it 'shows when each record was created' do
    expect(page).to have_content(@library1.created_at)
    expect(page).to have_content(@library2.created_at)
    expect(page).to have_content(@library3.created_at)
    expect(page).to_not have_content(@library3.updated_at)
  end

  it 'has an edit link for each record' do
    expect(page).to have_link("Edit #{@library1.name} Library", :href=>"/libraries/#{@library1.id}/edit")
    expect(page).to have_link("Edit #{@library2.name} Library", :href=>"/libraries/#{@library2.id}/edit")
    expect(page).to have_link("Edit #{@library3.name} Library", :href=>"/libraries/#{@library3.id}/edit")
  end

  it 'edit link redirects to library edit page' do
    click_link("Edit #{@library3.name} Library", :match => :first)

    expect(page).to have_current_path("/libraries/#{@library3.id}/edit")
  end

  it 'has link to books and libraries indexes' do
    expect(page).to have_link("Books Index", :href=>"/books")
    expect(page).to have_link("Libraries Index", :href=>"/libraries")
  end

  it 'has a link to create a new library' do
    expect(page).to have_link("New Library", :href=>"/libraries/new")
  end

  it 'has a link to delete each library' do
    visit "/libraries/"
    expect(page).to have_link("Delete #{@library1.name} Library")
    expect(page).to have_link("Delete #{@library2.name} Library")
    expect(page).to have_link("Delete #{@library3.name} Library")

    click_on("Delete #{@library3.name} Library")
    expect(page).to have_current_path("/libraries")
    expect(page).to have_content("#{@library1.name}")
    expect(page).to have_content("#{@library2.name}")
    expect(page).to_not have_content("#{@library3.name}")
  end

  it 'has a link to sort libraries by number of books' do
    @book1 = @library1.books.create!(name: "Harry Potter and the Sorcerer's Stone", publish_year: 1998, available: true)

    @book2 = @library2.books.create!(name: "1Q84", publish_year: 2011, available: false)
    @book3 = @library2.books.create!(name: "On the Move: A Life", publish_year: 2015, available: true)

    visit "/libraries/"
    expect(page).to have_link("Sort by total number of books")

    click_on("Sort by total number of books")
    expect(@library2.name).to appear_before(@library1.name)
    expect(@library1.name).to appear_before(@library3.name)
    expect(page).to have_content("Book Count: 2")
    expect(page).to have_content("Book Count: 1")
    expect(page).to have_content("Book Count: 0")
  end

  it 'has a form to search for an exact match keyword' do
    expect(page).to have_field("Search")

    fill_in "Search", with: "Park Hill"
    click_button "Search"

    expect(page).to have_content("Park Hill")
    expect(page).to_not have_content("Denver Central")
    expect(page).to_not have_content("Ford-Warren")
  end
end
