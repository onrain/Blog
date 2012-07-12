class AdminLogin < ActiveRecord::Base
  attr_accessible :login, :password
end