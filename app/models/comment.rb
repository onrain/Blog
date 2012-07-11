class Comment < ActiveRecord::Base
  attr_accessible :comment_content, :data_p, :email, :post_id, :username
  validates :comment_content, :presence=>true
end
