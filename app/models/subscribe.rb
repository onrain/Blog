class Subscribe < ActiveRecord::Base
  attr_accessible :email, :send_bool
  validates :email, :presence => true,
                    :uniqueness => true,
                    :length => {:minimum => 6, :maximum => 90},
                    :format => {:with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i}
end
