class CreateSubscribes < ActiveRecord::Migration
  def change
    create_table :subscribes do |t|
      t.string :email
      t.integer :send_bool, default:1

      t.timestamps
    end
  end
end
