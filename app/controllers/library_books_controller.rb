class LibraryBooksController < ApplicationController

  def index
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

    library.books.create(name: params[:name],
                publish_year: params[:publish_year],
                available: params[:available])

    redirect_to "/libraries/#{library[:id]}/books"
  end
end
