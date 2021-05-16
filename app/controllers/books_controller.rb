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
    book.update(book_params)
    book.save
    redirect_to "/books/#{book.id}"
  end

  def destroy
    book = Book.find(params[:id])
    book.destroy
    redirect_to "/books"
  end

  private
    def book_params
      params.permit(:name, :publish_year, :available)
    end
end
