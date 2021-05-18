require 'rails_helper'

describe Book, type: :model do

  describe 'relationship' do
    it { should belong_to(:library) }
  end

  before :each do
    @library1 = Library.create!(name: "Denver Central", staff_count: 35, member_count: 5000, open: true, created_at: DateTime.new(2021,2,3,4,5,6))

    @book1 = @library1.books.create!(name: "Harry Potter and the Sorcerer's Stone", publish_year: 1998, available: true)
    @book2 = @library1.books.create!(name: "1Q84", publish_year: 2011, available: false)
    @book3 = @library1.books.create!(name: "On the Move: A Life", publish_year: 2015, available: true)
  end

  describe 'class methods' do
    it '#sort_by_name orders books by name' do
      books = @library1.books

      expect(books.sort_by_name).to eq([@book2, @book1, @book3])
    end

    it '#filter_available_by_search_exact returns available books matching keyword exactly' do
      @book4 = @library1.books.create!(name: "On the Move: A Life", publish_year: 2015, available: true)
      @book5 = @library1.books.create!(name: "On the Move: A Life", publish_year: 1955, available: true)

      expect(Book.filter_available_by_search_exact("On the Move: A Life")).to eq([@book3, @book4, @book5])
    end
  end
end
