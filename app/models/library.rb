class Library < ApplicationRecord
  has_many :books, dependent: :destroy

  def book_count
    self.books.count
  end

  def self.sort_by_book_count
    # # RUBY
    # libraries = Library.all
    # libraries.sort_by do |library|
    #   library.book_count
    # end.reverse

    # # SQL
    # find_by_sql(' SELECT lib.*, COUNT(books.name) AS book_count
    # FROM libraries lib
    #   FULL OUTER JOIN books ON books.library_id = lib.id
    # GROUP BY lib.id
    # ORDER BY book_count DESC ')

    #Active Record
    self.select("libraries.*, count(books.id) AS book_count")
    .left_joins(:books)
    .group(:id)
    .order("book_count DESC") #also works with order(book_count: :DESC)
  end

  def self.sort_by_created_at
    Library.order(created_at: :desc)
  end

  def filter_books_by_published_year(min_year)
    self.books.where("publish_year > #{min_year}")
  end

  def self.filter_by_search_exact(query)
    self.where("name LIKE '#{query}'")
  end

  def self.filter_by_search_partial(query)
    self.where("name LIKE '%#{query}%'")
  end
end
