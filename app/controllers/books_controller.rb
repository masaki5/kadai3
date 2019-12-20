class BooksController < ApplicationController
	 before_action :authenticate_user!
  def index
  	  @books = Book.all
  	  @book = Book.new
  	  @user = current_user
  end

  def show
  	  @book = Book.find(params[:id])
  	  @user = @book.user
      @books = Book.new
  end

  def new
  	  @book = Book.new
  	  @book = Book.all
  end

  def edit
  	  @book = Book.find(params[:id])
      @books = Book.new
      if @book.user.id != current_user.id
        redirect_to books_path
      end
  end

  def update
  	  @book = Book.find(params[:id])
  	  @book.user_id = current_user.id
  	  if @book.update(book_params)
      flash[:notice] ="You have updated book successfully."
  	  redirect_to book_path(@book.id)
    else
      render action: :edit
    end
  end

  def create
  	  #@user = User.new(user_params)
  	  @book = Book.new(book_params)
  	  #~さんが投稿したかわかるようにするため。
  	  @book.user_id = current_user.id
  	  if @book.save
      flash[:notice] ="You have creatad book successfully."
  	  #redirect_to books_path
  	  redirect_to book_path(@book.id)
      else
      @books = Book.all
      @user = current_user
      render action: :index
    end
  end

  def destroy
      book = Book.find(params[:id])
      #@book.user_id = current_user.id
      book.destroy
      redirect_to books_path

  end
  private
  def book_params
      params.require(:book).permit(:title, :body)
  end
end
