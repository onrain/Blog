class Comment < ActiveRecord::Base
  attr_accessible :comment_content, :data_p, :email, :post_id, :username, :admin_id
  belongs_to :post
  validates :comment_content, :presence=>true, :length => {:minimum => 3, :maximum => 255}
  validates :email, :presence => true, 
                    :length => {:minimum => 6, :maximum => 254},
                    :format => {:with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i}
                    
  scope :show_comment, lambda{|id| where(post_id:id).order("data_p desc") unless id.nil? }
                    
end
