class RemoveDatecraetefrompost < ActiveRecord::Migration
  def change
    remove_column :posts, :data_create
    add_column :posts, :date_create, :string
  end
end
