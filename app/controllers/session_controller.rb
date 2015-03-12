class SessionController < ApplicationController
  def new
    @user = User.new
  end

  def create
    @user = User.find_by(name: session_params[:name]).try :authenticate, session_params[:password]
    if @user
      session[:user] = @user.id
      flash[:notice] = 'Login Successful'
      redirect_to root_path
    else
      @user = User.new
      flash[:error] = 'Wrong Name or Password'
      render :new
    end
  end

  def destroy
  end

  def session_params
    params.require(:user).permit(:name, :password) if params[:user]
  end
end
