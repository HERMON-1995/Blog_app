require 'rails_helper'
require 'capybara/rspec'

RSpec.describe 'User', type: :feature, js: false do
  before do
    # Create some sample users for testing
    User.create(name: 'John', photo: 'https://example.com/john.jpg')
    User.create(name: 'Alice', photo: 'https://example.com/alice.jpg')
  end

  it 'displays the list of users' do
    visit '/users'

    expect(page).to have_content('John')
    expect(page).to have_content('Alice')
  end

  it 'links to user show pages' do
    visit '/users'

    click_link 'John'

    user_id = User.find_by(name: 'John').id
    expect(current_path).to eq("/users/#{user_id}")
  end

  it 'displays user information on show page' do
    user = User.create(name: 'Jane', photo: 'https://example.com/jane.jpg')

    visit "/users/#{user.id}"

    expect(page).to have_content('Jane')
    expect(page).to have_selector("img[src='https://example.com/jane.jpg']")
  end
end
