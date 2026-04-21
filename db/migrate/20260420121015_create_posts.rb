class CreatePosts < ActiveRecord::Migration[8.1]
  def change
    create_table :posts do |t|
      t.string :name
      t.text :text

      t.timestamps
    end
  end
end
