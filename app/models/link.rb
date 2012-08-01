class Link < ActiveRecord::Base
  attr_accessible :original_url, :short_url, :user_id
  belongs_to :user
  
  before_save { self.short_url.downcase! }
  before_save :undesirable_words
  before_save :vanity_url_check
  before_save :clean_up_url
  
  validates :short_url, uniqueness: { case_sensitive: false }
  
  private
  
    def undesirable_words
      undesirable_words = ["hate", "bad", "fuck", "shit", "bitch"]
      if undesirable_words.include?(self.short_url)
        self.short_url = ""
      else
        self.short_url = self.short_url
      end
    end
    
    def vanity_url_check
      if self.short_url.empty?
        random_string = (0...8).map{65.+(rand(25)).chr}.join
        self.short_url = random_string
      else
        self.short_url = self.short_url
      end
    end
    
    def clean_up_url
      base_url = "http://"
      if self.original_url =~ /https?/
       self.original_url
      else
        self.original_url = base_url + self.original_url
      end
    end
end
