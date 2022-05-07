class AddTextToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :text, :string
  end
end
