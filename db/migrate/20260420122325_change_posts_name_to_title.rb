class ChangePostsNameToTitle < ActiveRecord::Migration[8.1]
  def change
    rename_column(:posts, :name, :title)
  end
end
