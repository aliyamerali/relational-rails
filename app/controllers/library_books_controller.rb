class LibraryBooksController < ApplicationController

  def index
    @library = Library.find(params[:id])

    if params[:filter]
      @books = @library.filter_books_by_published_year(params[:filter])
    else
      @books = @library.books
    end

    if params[:sort] == "alpha"
      @books = @books.sort_by_name
    end
  end

  def new
    @library = Library.find(params[:id])
  end

  def create
    library = Library.find(params[:id])
    library.books.create(library_book_params)
    redirect_to "/libraries/#{library[:id]}/books"
  end

  private
    def library_book_params
      params.permit(:name, :publish_year, :available)
    end
end
