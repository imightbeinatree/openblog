class AddIndexToForeignKeys < ActiveRecord::Migration
  def change
    add_index :posts, :user_id
    add_index :comments, :post_id
    add_index :comments, :user_id
  end
end
