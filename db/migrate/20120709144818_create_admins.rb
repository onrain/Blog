class CreateAdmins < ActiveRecord::Migration
  def change
    create_table :admins do |t|
      t.string :title
      t.integer :published, default:0
      t.datetime :data_create
      t.text :article_description
      t.text :article_content

      t.timestamps
    end
  end
end
