class UsersController < ApplicationController
	before_action :authenticate_user!, only: [:show, :edit, :update, :index]
  before_action :ensure_correct_user, {only: [:edit, :update]}
  def show
  	  @user = User.find(params[:id])
      @book = Book.new
      @books = @user.books
  end

  def index
      @users = User.all
      @user = current_user
      @book = Book.new
  end

  def new
      @user = User.new
      @user = User.all
  end

  def edit
  	  @user = User.find(params[:id])
  end

  def update
      @user = User.find(params[:id])
      if @user.update(user_params)
        flash[:notice]="You have updated user successfully."
      redirect_to user_path(@user.id)
      else
        render action: :edit
      end
  end
private
  def user_params
      params.require(:user).permit(:introduction,:name, :profile_image)
  end

  def ensure_correct_user
      @user = User.find(params[:id])
  if current_user.id !=  @user.id

   redirect_to user_path(current_user.id)

  end
end

end

