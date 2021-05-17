class LibrariesController < ApplicationController

  def index
    if params[:sort] == "book_count"
      @libraries = Library.sort_by_book_count
    else
      @libraries = Library.sort_by_created_at
    end
  end

  def show
    @library = Library.find(params[:id])
    @book_count = @library.book_count
  end

  def new
  end

  def create
    library = Library.create(library_params)
    redirect_to '/libraries'
  end

  def edit
    @library = Library.find(params[:id])
  end

  def update
    library = Library.find(params[:id])
    library.update(library_params)
    library.save
    redirect_to "/libraries/#{library.id}"
  end

  def destroy
    library = Library.find(params[:id])
    library.destroy
    redirect_to '/libraries'
  end

  private
    def library_params
      params.permit(:name, :member_count, :staff_count, :open)
    end
end
