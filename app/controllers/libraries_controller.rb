class LibrariesController < ApplicationController

  def index
    @libraries = Library.order(created_at: :desc)
  end

  def show
    @library = Library.find(params[:id])
  end

end
