require 'rails_helper'

RSpec.describe 'Postscontroller', type: :request do
  describe 'GET #post' do
    before(:each) do
      get '/users/1/posts'
    end

    it 'GET request return correct responses' do
      expect(response).to have_http_status(:success)
      expect(response).to render_template(:index)
    end
  end

  describe 'Get #show' do
    before(:each) do
      get '/users/1/posts/1'
    end

    it 'return show post' do
      expect(response).to have_http_status(:success)
      expect(response).to render_template(:show)
    end
  end
end
