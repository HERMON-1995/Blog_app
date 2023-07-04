require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  let(:user) { User.create(name: 'John', photo: 'https://otkritkis.com/wp-content/uploads/2021/12/original-5-4.jpg', bio: 'Passionate about science and technology.') }

  describe 'GET /users/:user_id/posts' do
    it 'returns a successful response' do
      get user_posts_path(user)

      expect(response).to have_http_status(:success)
    end

    it 'renders the index template' do
      get user_posts_path(user)

      expect(response).to render_template(:index)
    end
  end

  describe 'GET /users/:user_id/posts/:id' do
    it 'returns a successful response' do
      post = user.posts.create(title: 'Post 1', text: 'Lorem ipsum')

      get user_post_path(user, post)

      expect(response).to have_http_status(:success)
    end

    it 'renders the show template' do
      post = user.posts.create(title: 'Post 1', text: 'Lorem ipsum')

      get user_post_path(user, post)

      expect(response).to render_template(:show)
    end
  end

  describe 'GET /users/:user_id/posts/new' do
    it 'returns a successful response' do
      get new_user_post_path(user)

      expect(response).to have_http_status(:success)
    end

    it 'renders the new template' do
      get new_user_post_path(user)

      expect(response).to render_template(:new)
    end
  end

  describe 'POST /users/:user_id/posts' do
    context 'with valid parameters' do
      it 'creates a new post and redirects' do
        post_params = { post: { title: 'New Post', text: 'Lorem ipsum' } }

        expect do
          post user_posts_path(user), params: post_params
        end.to change(Post, :count).by(1)

        expect(response).to redirect_to(user_posts_path(user))
      end
    end

    context 'with invalid parameters' do
      it 'does not create a new post and renders the new template' do
        post_params = { post: { title: '', text: '' } }

        expect do
          post user_posts_path(user), params: post_params
        end.not_to change(Post, :count)

        expect(response).to render_template(:new)
      end
    end
  end
end
