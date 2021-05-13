class LibraryBooksController < ApplicationController

  def index
    # binding.pry
    @library = Library.find(params[:id])
    @books = @library.books
  end
end
