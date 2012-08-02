# == Schema Information
#
# Table name: hits
#
#  id         :integer          not null, primary key
#  link_id    :integer
#  ip_address :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Hit < ActiveRecord::Base
  attr_accessible :ip_address, :link_id
  
  belongs_to :link
end
