class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :username
      t.string :email
      t.datetime :data_p
      t.integer :post_id
      t.text :comment_content

      t.timestamps
    end
  end
end
