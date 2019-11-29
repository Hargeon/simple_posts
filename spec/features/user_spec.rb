require 'rails_helper'

RSpec.describe 'Sign up features' do
  before(:each) do
    user = build(:user)
    visit('/')
    click_link('Sign up')
    fill_user_data(user)
    click_button('Sign up')
  end

  it { expect(page).to have_link('Users') }
  it { expect(page).to have_link('Posts') }
  it { expect(page).to have_link('About') }
  it { expect(page).to have_link('New Post') }
  it { expect(page).to have_link('Log out') }
  it { expect(page).not_to have_link('Sign in') }
  it { expect(page).not_to have_link('Sign up') }
end
