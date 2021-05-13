class LibrariesController < ApplicationController

  def index
    @libraries = Library.order(created_at: :desc)
  end

  def show
    @library = Library.find(params[:id])
    @book_count = @library.books.count
  end

  def new
  end

end
