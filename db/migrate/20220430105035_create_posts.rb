class CreatePosts < ActiveRecord::Migration[6.1]
  def change
    create_table :posts do |t|
      t.references :user, null: false, foreign_key: true
      t.string :title
      t.text :text
      t.integer :likes_counter
      t.integer :comments_counter

      t.timestamps
    end
  end
end
