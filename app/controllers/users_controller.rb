class UsersController < ApplicationController
  before_action :correct_user, only: [:edit]
  def correct_user
    user = User.find(params[:id])
    if current_user.id != user.id
      redirect_to user_path(current_user)
    end
  end

  def home
  end

  def index
    @users = User.all
    @book = Book.new
    @user = current_user
  end
  def show
    @books = Book.where(user_id: params[:id])
    @book = Book.new
    @user = current_user
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      flash[:notice] = "You have updated user successfully."
      redirect_to user_path(@user.id)
    else
      render :edit
    end
  end

  private

  def user_params
    params.require(:user).permit(:name, :profile_image)
  end
end
