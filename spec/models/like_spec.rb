require 'rails_helper'

RSpec.describe Like, type: :model do
  describe 'like model' do
    subject { Like.new(author_id: 1, post_id: 1) }

    before { subject.save }

    it 'check if it increases the posts' do
      prev = Post.find(1).LikesCounter
      subject.update_likes_counter
      expect(Post.find(1).LikesCounter).to eq(1)
    end
  end
end