class Link < ActiveRecord::Base
  attr_accessible :original_url, :short_url, :user_id
  belongs_to :user
  
  before_save :clean_up_url
  
  private
  
    def clean_up_url
      base_url = "http://"
      if self.original_url =~ /https?/
       self.original_url
      else
        self.original_url = base_url + self.original_url
      end
    end
end
