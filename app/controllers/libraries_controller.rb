class LibrariesController < ApplicationController

  def index
    @libraries = Library.all
    # binding.pry
  end

  def show
    @library = Library.find(params[:id])
  end

end
