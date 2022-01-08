class EditsPostsTable < ActiveRecord::Migration[7.0]
  def change
    remove_column :posts,:user
    add_column :posts, :user_id, :integer, nullable: false
  end
end
