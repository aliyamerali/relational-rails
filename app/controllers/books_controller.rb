class BooksController < ApplicationController

  def index
    @books = Book.where(available: true)
  end

  def show
    @book = Book.find(params[:id])
  end

  def edit
    @book = Book.find(params[:id])
  end

  def update
    book = Book.find(params[:id])
    book.update({
                name: params[:name],
                publish_year: params[:publish_year],
                available: params[:available]
                })

    book.save
    redirect_to "/books/#{book.id}"
  end

end
