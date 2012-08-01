class RemoveAdminid < ActiveRecord::Migration
  def change
    remove_column :comments, :admin_id
  end
end
