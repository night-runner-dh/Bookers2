class UsersController < ApplicationController
  
  def show
     @user = User.find(params[:id])
     @books = @user.books    
  end

  def edit
    is_matching_login_user
    @user = User.find(params[:id])
  end

  def update
    is_matching_login_user
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user.id)
  end


  def index
     @users = User.all
  end
  

  def user_params
    params.require(:user).permit(:name, :profile_image)
  end  
  
    def is_matching_login_user
      user = User.find(params[:id])
      unless user.id == current_user.id
        redirect_to user_path(current_user.id)
      end
    end
end
