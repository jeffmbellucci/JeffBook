class UsersController < ApplicationController
  
  def new
    @user = User.new
    render :new
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      flash[:success] = "Welcome to JeffBook"
      # signin(@user)
      redirect_to @user
    else
      render :new
    end
  end
  
  def show
    @user = User.find(params[:id])
    render :show
  end
  
  def index
  end
  
  def destroy
    @user = User.find(params[:id])
    @user.delete
    redirect_to root_url
  end
  
end
