class CreatePhotosPosts < ActiveRecord::Migration
  def change
    create_join_table :photos, :posts
  end
end
