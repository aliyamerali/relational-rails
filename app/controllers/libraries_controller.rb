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

  def create
    library = Library.create(name: params[:name],
                            staff_count: params[:staff_count],
                            member_count: params[:member_count],
                            open: params[:open])

    redirect_to '/libraries'
  end

  def edit
    @library = Library.find(params[:id])
  end

  def update
    library = Library.find(params[:id])
    library.update({
      name: params[:name],
      member_count: params[:member_count],
      staff_count: params[:staff_count],
      open: params[:open]
      })

    library.save
    redirect_to "/libraries/#{library.id}"
  end
end
