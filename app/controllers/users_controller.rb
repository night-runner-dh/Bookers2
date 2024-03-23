class UsersController < ApplicationController
  
  def show
    @book = Book.new
     @user = User.find(params[:id])
     @books = @user.books 
  end

  def edit
    user = User.find(params[:id])
    unless user.id == current_user.id
        redirect_to user_path(current_user.id)
    end
    @user = User.find(params[:id])
  end

  def update
     user = User.find(params[:id])
      unless user.id == current_user.id
        redirect_to user_path(current_user.id)
      end
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "You have updated user successfully."
    redirect_to user_path(@user.id)
    else
      render :edit
    end
  end






  def index
    @book = Book.new
    @users = User.all
    @user =  current_user
  end
  

  def user_params
    params.require(:user).permit(:name, :profile_image,:introduction)
  end  
  
    def is_matching_login_user
      user = User.find(params[:id])
      unless user.id == current_user.id
        redirect_to user_path(current_user.id)
      end
    end
end
