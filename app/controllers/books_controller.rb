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
  		# redirect_to book_path(book.id)
  		# flash[:notice] = 
  		redirect_to book_path(book.id), notice: 'Book was successfully created.'
  	# else
  	# 	flash.now[:alert] = "Body can't be blank"
  	# 	render :book
  	end

  end

  def edit
    @book = Book.find(params[:id])
  end

  def show
  	@book = Book.find(params[:id])
  end
  private
  def book_params
  	params.require(:book).permit(:title, :body)
  end
end
