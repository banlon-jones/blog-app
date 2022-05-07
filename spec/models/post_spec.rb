require 'rails_helper'

RSpec.describe Post, type: :model do
  describe 'Post Model' do
    subject { Post.create(title: 'Title test', text: 'text', author_id: 1) }
    before { subject.save }

    it 'checks if subject is valid if there is a title' do
      expect(subject).to_not be_valid
    end

    it 'checks if subject is invalid if there is no title' do
      subject.title = nil
      expect(subject).to_not be_valid
    end

    it 'tests if title more than 250 characters to be invalid' do
      subject.title = 'a football passing play in which the receiver runs downfield before turning towards the middle of
       the fielda football passing play in which the receiver runs downfield before turning towards the middle of the field'
      expect(subject).to_not be_valid
    end
  end
  describe 'Post Model methods' do
    before do
      6.times do |number|
        subject.id = 1
        Comment.create(text: "test comment #{number}", author_id: 1, post: subject)
      end
    end

    it 'loads only the first five comments' do
      expect(subject.recent_comments.length).to eq(5)
    end
  end
end