require 'rails_helper'

RSpec.describe 'Postscontroller', type: :request do
  describe 'GET #post' do
    before(:each) do
      get '/posts'
    end

    it 'GET request return correct responses' do
      expect(response).to have_http_status(:success)
      expect(response).to render_template(:index)
      expect(response.body).to include('post index view')
    end
  end

  describe 'Get #show' do
    before(:each) do
      get '/posts/798'
    end

    it 'return show post' do
      expect(response).to have_http_status(:success)
      expect(response).to render_template(:show)
      expect(response.body).to include('show post')
    end
  end
end
