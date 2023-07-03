require 'rails_helper'
require 'capybara/rspec'

RSpec.describe 'User', type: :feature, js: false do
  before do
    # Create some sample users for testing with unique email addresses
    user1 = User.create(name: 'John', email: 'john@example.com', photo: 'https://example.com/john.jpg')
    user2 = User.create(name: 'Alice', email: 'alice@example.com', photo: 'https://example.com/alice.jpg')
    Post.create(title: 'Post 1', text: 'Content 1', author_id: user1.id)
    Post.create(title: 'Post 2', text: 'Content 2', author_id: user1.id)
    Post.create(title: 'Post 3', text: 'Content 3', author_id: user2.id)
  end

  it 'displays the list of users' do
    visit '/users'

    expect(page).to have_content('John')
    expect(page).to have_content('Alice')
  end

  it 'I can see the number of posts each user has written' do
    visit '/users'
    expect(page).to have_content('Number of posts: 2', count: 1)
    expect(page).to have_content('Number of posts: 1', count: 1)
  end

  it 'I can see the profile picture for each user' do
    visit '/users'

    expect(page).to have_selector("img[src='https://example.com/john.jpg']")
    expect(page).to have_selector("img[src='https://example.com/alice.jpg']")
  end

  it 'links to user show pages' do
    visit '/users'

    click_link 'John'

    user_id = User.find_by(name: 'John').id
    expect(current_path).to eq("/users/#{user_id}")
  end

  it 'displays user information on show page' do
    user = User.create(name: 'Jane', email: 'jane@example.com', photo: 'https://example.com/jane.jpg')

    visit "/users/#{user.id}"

    expect(page).to have_content('Jane')
    expect(page).to have_selector("img[src='https://example.com/jane.jpg']")
  end
end
