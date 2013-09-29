class AddAttachmentPhotoToTrucks < ActiveRecord::Migration
  def self.up
    change_table :trucks do |t|
      t.attachment :photo
    end
  end

  def self.down
    drop_attached_file :trucks, :photo
  end
end
