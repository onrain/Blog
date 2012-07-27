class ChangetableDateCreate < ActiveRecord::Migration
  def change
    change_column :posts, :date_create, :datetime
  end
end
