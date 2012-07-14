class Comment < ActiveRecord::Base
  belongs_to :admin, dependent:destroy
  attr_accessible :comment_content, :data_p, :email, :post_id, :username
  validates :comment_content, :presence=>true
end
