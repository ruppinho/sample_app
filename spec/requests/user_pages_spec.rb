require 'spec_helper'

describe 'User pages' do

  let(:base_title) { "Ruby on Rails Tutorial Sample App" }
  subject { page }

  describe 'signup page' do
    let(:page_title) { 'Sign up' }

    before :each do
      visit signup_path
    end

    it 'has the right content' do
      expect(page).to have_content(page_title)
    end

    it 'has the base title' do
      expect(page).to have_title(base_title)
    end

    it 'has a custom page title' do
      expect(page).to have_title(" | #{page_title}")
    end
  end

  describe 'profile page' do
    # Replace with code to make a user variable
    before { visit user_path(user) }

    it { should have_content(user.name) }
    it { should have_title(user.name) }
  end
end