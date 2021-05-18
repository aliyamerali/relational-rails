class LibraryBooksController < ApplicationController

  def index #TODO: How can both query strings persist in the url?
    @library = Library.find(params[:id])

    if params[:filter]
      @books = @library.filter_books_by_published_year(params[:filter])
    else
      @books = @library.books
    end

    if params[:sort]
      @books = @library.sort_books_by_name(@books)
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
