class Post < ApplicationRecord
  belongs_to :author, class_name: 'User'
  has_many :likes

  def update_post_counter
    author.increment(:post_counter)
  end

  def recent_comments
    comments.order(created_at: :desc).limit(5)
  end
end
