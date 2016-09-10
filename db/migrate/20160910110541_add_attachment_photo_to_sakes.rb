class AddAttachmentPhotoToSakes < ActiveRecord::Migration
  def self.up
    change_table :sakes do |t|
      t.attachment :photo
    end
  end

  def self.down
    remove_attachment :sakes, :photo
  end
end
