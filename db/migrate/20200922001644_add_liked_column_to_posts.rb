class AddLikedColumnToPosts < ActiveRecord::Migration[5.1]
  def change
    add_column :posts, :is_liked, :boolean, :default => false
  end
end
