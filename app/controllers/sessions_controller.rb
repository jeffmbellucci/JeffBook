class SessionsController < ApplicationController
  def new
    render :new
  end
  
  def create
    @user = User.find_by_name_and_password(params[:session][:name], 
                                           params[:session][:password])
    if @user
      flash[:success] ="Welcome back, #{@user.name}"
      login(@user)
      redirect_to @user
      
    else
      flash[:fail] = "Blew it on the name/password thing"
      render :new
    end
  end
  
  def destroy
    flash[:success] = "Signed out."
    log_out
    redirect_to root_url
  end
  
end
