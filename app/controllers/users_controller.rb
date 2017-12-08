class UsersController < ApplicationController

  def index
    @users = User.all
  end

  def new
    #@creator = current_user.creator.build
    @user = User.new
  end

  def show
    @user = User.find(params[:id])
  end
end
