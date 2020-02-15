class SessionController < ApplicationController
  def create
  end

  def destroy
  end

  def new
    @user = User.new
  end
end
