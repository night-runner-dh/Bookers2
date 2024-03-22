class BooksController < ApplicationController
  def new
    @book = Book.new
  end
  
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      redirect_to books_path
    else
      render :new
    end
  end
  
  def edit
   is_matching_login_user
   @book = Book.find(params[:id])
  end
  
  def update
    is_matching_login_user
    @book = Book.find(params[:id])
    @book.update(book_params)
    redirect_to books_path(@book.id)
  end
  
  def destroy
    book = Book.find(params[:id]) 
    book.destroy
    redirect_to books_path
  end

  def index
    @books = Book.all
  end

  def show
     @books = Book.all
     @book = Book.find(params[:id])
  end


  private

  def book_params
    params.require(:book).permit(:title, :body, )
  end

  def is_matching_login_user
    @book = Book.find(params[:id])
    unless @book.user_id == current_user.id
      redirect_to books_path
    end
  end


end
