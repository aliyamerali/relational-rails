require 'rails_helper'

describe Library, type: :model do
  describe 'relationship' do
    it { should have_many :books }
  end

  before :each do
    @library1 = Library.create!(name: "Denver Central", staff_count: 35, member_count: 5000, open: true, created_at: DateTime.new(2021,2,3,4,5,6))
    @library2 = Library.create!(name: "Ford-Warren", staff_count: 12, member_count: 1200, open: false, created_at: DateTime.new(2020,2,3,4,5,6))
    @library3 = Library.create!(name: "Park Hill", staff_count: 20, member_count: 2300, open: true, created_at: DateTime.new(2019,2,3,4,5,6))

    @book1 = @library1.books.create!(name: "Harry Potter and the Sorcerer's Stone", publish_year: 1998, available: true)

    @book2 = @library2.books.create!(name: "1Q84", publish_year: 2011, available: false)
    @book3 = @library2.books.create!(name: "On the Move: A Life", publish_year: 2015, available: true)
  end

  describe 'instance methods' do
    it '#book_count returns total count of books per library' do
      expect(@library1.book_count).to eq(1)
      expect(@library2.book_count).to eq(2)
      expect(@library3.book_count).to eq(0)
    end

    it '#filter_books_by_published_year returns books for that library published after entered year' do
      expect(@library2.filter_books_by_published_year(2011)).to eq([@book3])
    end
  end

  describe 'class methods' do
    it '#sort_by_book_count returns a list of libraries ordered by book count' do
      expected = [@library2, @library1, @library3]

      expect(Library.sort_by_book_count).to eq(expected)
    end

    it '#sort_by_created_at returns list of libraries sorted by most recently created' do
      expected = [@library1, @library2, @library3]

      expect(Library.sort_by_created_at).to eq(expected)
    end

    it '#filter_by_search returns only libraries with exact matches to search' do
      expect(Library.filter_by_search("Denver Central")).to eq([@library1])
    end
  end
end
