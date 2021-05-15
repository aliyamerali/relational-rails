class LibraryBooksController < ApplicationController

  def index
    @library = Library.find(params[:id])
    if params[:sort].nil?
      @books = @library.books
    else
      @books = @library.books.order(name: :asc)
    end
  end

  def new
    @library = Library.find(params[:id])
  end

  def create
    library = Library.find(params[:id])

    library.books.create(name: params[:name],
                publish_year: params[:publish_year],
                available: params[:available])

    redirect_to "/libraries/#{library[:id]}/books"
  end
end
