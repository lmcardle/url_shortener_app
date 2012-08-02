class LinksController < ApplicationController  
  def index
    @links = Link.all
  end
  
  def new
    @link = Link.new
  end
  
  def create
    
    @link = Link.new(:original_url => params[:link][:original_url],
                     :short_url => params[:link][:short_url], 
                     :user_id => current_user.id)
    if @link.save
      redirect_to user_path(current_user)
    else
      flash[:error] = "You have an issue with your definded Short URL"
      render 'new'
    end
  end
  
  def show
    @base_url = root_url
    @link = Link.find(params[:id])
  end
  
  def destroy
    user = Link.find(params[:id]).user_id
    Link.find(params[:id]).destroy
    redirect_to user_path(user)
  end  
end
