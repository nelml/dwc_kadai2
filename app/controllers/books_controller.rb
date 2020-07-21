class BooksController < ApplicationController
  def top
  end

  def main
  	@books = Book.all
  	@book = Book.new
  end

  def create
  	book = Book.new(book_params)
  	if book.save

  		redirect_to book_path(book.id), notice: 'Book was successfully created.'
    end
  end

  def update
    book = Book.find(params[:id])
    if book.update(book_params)

      redirect_to book_path(book.id), notice: 'Book was successfully updated.'
      else
      redirect_to books_path, notice: "error!  I couldn't do it ..."
    end
  end
  def edit
    @book = Book.find(params[:id])
  end

  def show
  	@book = Book.find(params[:id])
  end

  def destroy
    book = Book.find(params[:id])
    if book.destroy
      redirect_to books_path, notice: 'Book was successfully destroyed.'
      else
      redirect_to books_path, notice: "error!  I couldn't do it ..."
    end
  end

  private
  def book_params
  	params.require(:book).permit(:title, :body)
  end
end
