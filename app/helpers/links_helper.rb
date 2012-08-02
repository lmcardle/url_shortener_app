require 'rest_client'
require 'open-uri'
require 'json'

module LinksHelper

  def country_finder(ip_address)
    response = RestClient.get("http://api.hostip.info/get_html.php", 
                              :params => { :ip => "#{ip_address}" })
    response.split("\n").first
  end

end
