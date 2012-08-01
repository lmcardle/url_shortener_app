class UsersController < ApplicationController
  
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save
      redirect_to @user
    else
      render 'new'
    end
  end
  
  def show
    @user = User.find(params[:id])
    @links = @user.links.all
    @base_url = root_url
  end
  
  
end