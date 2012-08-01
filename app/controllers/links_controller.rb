class LinksController < ApplicationController
  
  def index
    @links = Link.all
  end
  
  def new
    @link = Link.new
  end
  
  def create
    default_hostname = "localhost:3000/"
    random_string = (0...8).map{65.+(rand(25)).chr}.join
    short_url = default_hostname + random_string
    
    @link = Link.new(:original_url => params[:link][:original_url], :short_url => random_string)
    if @link.save
      redirect_to @link
    end
  end
  
  def show
    @link = Link.find(params[:id])
  end  
  
  def goto
    @link = Link.find_by_short_url!(params[:short_url])
    redirect_to @link.original_url
  end
    
end
