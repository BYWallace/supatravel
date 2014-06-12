class AddPhotoImageToPhotos < ActiveRecord::Migration
  def self.up
    add_attachment :photos, :photo_image
  end

  def self.down
    remove_attachment :photos, :photo_image
  end
end
