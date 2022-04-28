require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET #index' do
    before(:each) do
      get '/'
    end

    it 'GET request return correct response' do
      expect(response).to have_http_status(:ok)
    end

    it 'response body includes correct text' do
      expect(response.body).to include('list of users')
    end

    it 'renders a correct template' do
      expect(response).to render_template(:index)
    end
  end

  describe 'Get #show' do
    before(:each) do
      get '/users/798'
    end

    it 'GET request return correct response' do
      expect(response).to have_http_status(:ok)
      expect(response).to render_template(:show)
      expect(response.body).to include('user profile')
    end
  end
end