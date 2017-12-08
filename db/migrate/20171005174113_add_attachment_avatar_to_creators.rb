class AddAttachmentAvatarToCreators < ActiveRecord::Migration[5.1]
  def self.up
    change_table :creators do |t|
      t.attachment :avatar
    end
  end

  def self.down
    remove_attachment :creators, :avatar
  end
end
