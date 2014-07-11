require 'spec_helper'

describe 'User pages' do

  let(:base_title) { "Ruby on Rails Tutorial Sample App" }
  subject { page }

  describe 'profile page' do
    let(:user) { FactoryGirl.create(:user) }
    before { visit user_path(user) }

    it { should have_content(user.name) }
    it { should have_title(user.name) }
  end

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

  describe 'signup' do

    before { visit signup_path }

    let(:submit) { 'Create my account' }

    describe 'with invalid information' do
      it 'should not create a user' do
        expect { click_button submit }.not_to change(User, :count)
      end
    end

    describe 'with valid information' do
      before do
        fill_in 'Name',         with: 'Example User'
        fill_in 'Email',        with: 'user@example.com'
        fill_in 'Password',     with: 'foobar'
        fill_in 'Confirmation', with: 'foobar'
      end

      it 'should create a user' do
        expect { click_button submit }.to change(User, :count).by(1)
      end
    end
  end
end