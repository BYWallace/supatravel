class CreatePhotos < ActiveRecord::Migration
  def change
    create_table :photos do |t|
      t.references :post, null: false

      t.timestamps
    end
  end
end
