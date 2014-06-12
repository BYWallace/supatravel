class AddUserToPhotos < ActiveRecord::Migration
  def change
    add_column :photos, :url, :text
    add_column :photos, :user_id, :integer
  end
end
