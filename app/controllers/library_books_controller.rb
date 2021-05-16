class LibraryBooksController < ApplicationController

  def index #TODO: How can both query strings persist in the url?
    @library = Library.find(params[:id])
    if params[:filter].nil? && params[:sort].nil?
      @books = @library.books
    elsif !params[:sort].nil?
      @books = @library.books.order(name: :asc)
    elsif !params[:filter].nil?
      min_year = params[:filter]
      @books = @library.books.where("publish_year > #{min_year}")
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
