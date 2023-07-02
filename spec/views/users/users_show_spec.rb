require 'rails_helper'
require 'capybara/rspec'

RSpec.describe 'User Show', type: :feature, js: false do
  let(:user) { User.create(name: 'John', photo: 'https://example.com/john.jpg', bio: 'Passionate about science and technology.') }
  let!(:post1) { user.posts.create(title: 'Post 1', text: 'Lorem ipsum') }
  let!(:post2) { user.posts.create(title: 'Post 2', text: 'Dolor sit amet') }
  let!(:post3) { user.posts.create(title: 'Post 3', text: 'Consectetur adipiscing elit') }

  it 'displays user information' do
    visit user_path(user)

    expect(page).to have_content('John')
    expect(page).to have_selector("img[src='https://example.com/john.jpg']")
    expect(page).to have_content('Bio')
    expect(page).to have_content('Passionate about science and technology.')
  end

  it 'displays the user\'s recent posts' do
    visit user_path(user)

    expect(page).to have_content('Post 1')
    expect(page).to have_content('Post 2')
    expect(page).to have_content('Post 3')
  end

  it 'displays the post information on individual post pages' do
    visit user_post_path(user, post1)

    expect(page).to have_content('Post 1')
    expect(page).to have_content('Lorem ipsum')
  end

  it 'links to see all posts' do
    visit user_path(user)

    click_link 'See all posts'

    expect(current_path.chomp('/')).to eq(user_posts_path(user))
  end
end
