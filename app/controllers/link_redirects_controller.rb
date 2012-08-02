class LinkRedirectsController < ApplicationController
  
  def show
    @link = Link.find_by_short_url!(params[:short_url])
    remote_ip = request.remote_ip
    Hit.create(:link_id => @link.id, :ip_address => remote_ip)
    
    redirect_to @link.original_url
  end
  
end