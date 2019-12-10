class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :screen_user, only: [:edit]

 def authenticate
  redirect_to new_user_session_path unless user_signed_in?
 end

  def show
    @user = User.find(params[:id])
  	@books = @user.books.order(created_at: :desc)
  	@book = Book.new
  end
  def index
    @book = Book.new
    @user = current_user
    @users = User.all
  end
  def edit
    @user = User.find(params[:id])
  end
  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
        flash[:notice] = "successfully"
        redirect_to user_path(@user.id)
    else
      @book = Book.new
      @users = User.all
      render :edit
    end
  end
  private
  def screen_user
    user = User.find(params[:id])
    if
        user.id != current_user.id
        redirect_to user_path(current_user.id)
    end
  end
  def user_params
  	params.require(:user).permit(:name, :profile_image, :introduction)
  end
end
