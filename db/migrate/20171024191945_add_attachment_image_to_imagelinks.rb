class AddAttachmentImageToImagelinks < ActiveRecord::Migration
  def self.up
    include Paperclip::Schema
    change_table :image_links do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :image_links, :image
  end
end
