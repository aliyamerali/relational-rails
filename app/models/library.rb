class Library < ApplicationRecord
  has_many :books, dependent: :destroy

  def book_count
    self.books.count
  end

  def self.sort_by_book_count
    libraries = Library.all
    libraries.sort_by do |library|
      library.book_count
    end.reverse
  end

  def self.sort_by_created_at
    Library.order(created_at: :desc)
  end
end
