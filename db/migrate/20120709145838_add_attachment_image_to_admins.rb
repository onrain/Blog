class AddAttachmentImageToAdmins < ActiveRecord::Migration
  def self.up
    change_table :admins do |t|
      t.has_attached_file :image
    end
  end

  def self.down
    drop_attached_file :admins, :image
  end
end
