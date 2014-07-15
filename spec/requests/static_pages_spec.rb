require 'spec_helper'

describe 'Static pages' do

  subject { page }

  shared_examples_for 'a static page' do
    its 'title contains the base title' do
      expect(page).to have_title(full_title(page_title))
    end

    its 'heading contains the page title' do
      expect(page).to have_selector('h1', text: heading)
    end
  end

  describe 'Home page' do
    let(:heading)    { 'Sample App' }
    let(:page_title) { '' }

    before :each do
      visit root_path
    end

    it_behaves_like 'a static page'

    it 'does not have a custom page title' do
      expect(page).to_not have_title(' | Home')
    end

    describe 'for signed-in users' do
      let(:user) { FactoryGirl.create(:user) }
      before do
        FactoryGirl.create(:micropost, user: user, content: 'Lorem ipsum')
        FactoryGirl.create(:micropost, user: user, content: 'Dolor sit amet')
        sign_in user
        visit root_path
      end

      it "should render the user's feed" do
        user.feed.each do |item|
          expect(page).to have_selector("li##{item.id}", text: item.content)
        end
      end

      describe 'follower/following counts' do
        let(:other_user) { FactoryGirl.create(:user) }
        before do
          other_user.follow!(user)
          visit root_path
        end

        it { should have_link('0 following', href: following_user_path(user)) }
        it { should have_link('1 followers', href: followers_user_path(user)) }
      end
    end
  end

  describe 'Help page' do
    let(:page_title) { 'Help' }
    let(:heading)    { 'Help' }

    before :each do
      visit help_path
    end

    it_behaves_like 'a static page'
  end

  describe 'About page' do
    let(:page_title) { 'About Us' }
    let(:heading) { 'About Us' }

    before :each do
      visit about_path
    end

    it_behaves_like 'a static page'
  end

  describe 'Contact page' do
    let(:page_title) { 'Contact' }
    let(:heading) { 'Contact' }

    before :each do
      visit contact_path
    end

    it_behaves_like 'a static page'
  end
end
