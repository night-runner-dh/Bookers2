class BooksController < ApplicationController
  def new
    @book = Book.new
  end
  
   # @books = Book.all
  # render :index
  def create
    @book = Book.new(book_params)
    @book.user_id = current_user.id
    if @book.save
      flash[:notice] = "Book was successfully created."
        redirect_to  book_path(@book.id) 
    else
      @books = Book.all
      @user =  current_user
      render :index
    end
  end
  
  def edit
     @book = Book.find(params[:id])
    unless @book.user_id == current_user.id
      redirect_to books_path
    end
  end
  
  def update
     @book = Book.find(params[:id])
       if @book.update(book_params)
       flash[:notice] = "Book was successfully updated."
       redirect_to book_path(@book.id)
       else
       render :edit
       end
  end
  
  def destroy
    book = Book.find(params[:id]) 
    book.destroy
    redirect_to books_path,notice: 'Book was successfully destroyed.' 
  end

  def index
    @user =  current_user
    @book = Book.new
    @books = Book.all
  end

  def show
     
     @book2 = Book.new
     @books = Book.all
     @book = Book.find(params[:id])
     @user =  @book.user
  end


  private

  def book_params
    params.require(:book).permit(:title, :body, )
  end



end
