require 'spec_helper'

describe "Static pages" do
  let(:base_title) { "Ruby on Rails Tutorial Sample App" }

  describe 'Home page' do
    let(:page_title) { 'Home' }

    before :each do
      visit root_path
    end

    it "has the content 'Sample App'" do
      expect(page).to have_content('Sample App')
    end

    it 'has the base title' do
      expect(page).to have_title(base_title)
    end

    it 'does not have a custom page title' do
      expect(page).to_not have_title(" | #{page_title}")
    end
  end

  describe 'Help page' do
    let(:page_title) { 'Help' }

    before :each do
      visit help_path
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

  describe 'About page' do
    let(:page_title) { 'About Us' }

    before :each do
      visit about_path
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

  describe 'Contact page' do
    let(:page_title) { 'Contact' }

    before :each do
      visit contact_path
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
end
