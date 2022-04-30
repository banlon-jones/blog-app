class AddCommentscounterToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :CommentsCounter, :integer
  end
end
