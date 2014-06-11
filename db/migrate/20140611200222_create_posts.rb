class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.string :title, null: false
      t.text :story, null: false
      t.string :location
      t.float :latitude, null: true
      t.float :longitude, null: true
      t.references :user, null: false

      t.timestamps
    end
  end
end
