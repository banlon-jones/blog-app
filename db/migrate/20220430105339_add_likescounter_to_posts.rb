class AddLikescounterToPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :posts, :LikesCounter, :integer
  end
end
