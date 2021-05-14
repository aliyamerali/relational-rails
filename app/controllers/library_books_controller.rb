class LibraryBooksController < ApplicationController

  def index
    @library = Library.find(params[:id])
    @books = @library.books
  end

  def new
  end
end
