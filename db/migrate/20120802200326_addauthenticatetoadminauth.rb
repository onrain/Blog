class Addauthenticatetoadminauth < ActiveRecord::Migration
 def self.up
    add_column :admin_auths, :authentication_token, :string
  end

  def self.down
    remove_column :admin_auths, :authentication_token
  end
end
