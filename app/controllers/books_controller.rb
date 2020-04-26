class BooksController < ApplicationController
  def index
  	@books = Book.all
  	@book = Book.new
  	render "new"
  end

  def show
  	@book = Book.find(params[:id])
  end

  def edit
  	@book = Book.find(params[:id])
  end
  def new

  end
  def create
    @books = Book.all
  	@book = Book.new(book_params)
  	if @book.save
  	flash[:notice] = "successfully"
  	redirect_to book_path(@book.id)
  else
  	render "new"
 end
end
  def update
  	@book = Book.find(params[:id])
  	if @book.update(book_params)
  	flash[:notice] = "successfully"
  	redirect_to book_path(@book)
  else
  	render "edit"
  end
end
  def destroy
  	book = Book.find(params[:id])
  	book.destroy
  	redirect_to books_path
  end
  private
  def book_params
  	params.require(:book).permit(:title, :body)
end
end
