class Comment < ActiveRecord::Base
  attr_accessible :comment_content, :data_p, :email, :post_id, :username, :admin_id
  belongs_to :admin
  validates_presence_of :comment_content
end
