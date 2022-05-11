require 'rails_helper'

RSpec.describe Comment, type: :model do
  describe 'Comment model' do
    subject { Comment.new(text: 'test post 1', author_id: 1, post_id: 1) }

    before { subject.save }

  end
end
