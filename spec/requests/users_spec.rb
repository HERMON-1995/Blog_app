require 'rails_helper'

RSpec.describe 'Users', type: :request do
  let(:user) { User.create(name: 'John', photo: 'https://otkritkis.com/wp-content/uploads/2021/12/original-5-4.jpg', bio: 'Passionate about science and technology.') }

  describe 'GET /users/:id' do
    it 'returns a successful response' do
      get user_path(user)

      expect(response).to have_http_status(:success)
    end

    it 'renders the show template' do
      get user_path(user)

      expect(response).to render_template(:show)
    end
  end

  describe 'GET /users' do
    it 'returns a successful response' do
      get users_path

      expect(response).to have_http_status(:success)
    end

    it 'renders the index template' do
      get users_path

      expect(response).to render_template(:index)
    end
  end
end
