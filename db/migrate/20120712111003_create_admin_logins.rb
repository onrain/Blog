class CreateAdminLogins < ActiveRecord::Migration
  def change
    create_table :admin_logins do |t|
      t.string :login
      t.string :password

      t.timestamps
    end
  end
end
