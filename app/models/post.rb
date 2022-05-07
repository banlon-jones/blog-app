class Post < ApplicationRecord
  validates :title, presence: true, length: { maximum: 250 }
  validates :CommentsCounter, :LikesCounter, numericality: { greater_than_or_equal_to: 0 }
  belongs_to :author, class_name: 'User'
  has_many :comments
  has_many :likes

  def update_post_counter
    author.increment(:CommentsCounter)
  end

  def recent_comments
    comments.order(created_at: :desc).limit(5)
  end
end
