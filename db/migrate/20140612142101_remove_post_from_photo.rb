class RemovePostFromPhoto < ActiveRecord::Migration
  def change
    remove_column :photos, :post_id, :integer
  end
end
