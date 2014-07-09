require 'spec_helper'

describe "Static pages" do
  let(:base_title) { "Ruby on Rails Tutorial Sample App" }

  describe 'Home page' do
    let(:static_page) { 'home' }

    before :each do
      visit "/static_pages/#{static_page}"
    end

    it "has the content 'Sample App'" do
      visit '/static_pages/home'
      expect(page).to have_content('Sample App')
    end

    it 'has the base title' do
      expect(page).to have_title(base_title)
    end

    it 'does not have a custom page title' do
      expect(page).to_not have_title(" | #{static_page.camelize}")
    end
  end

  describe 'Help page' do
    let(:static_page) { 'help' }

    before :each do
      visit "/static_pages/#{static_page}"
    end

    it "has the content 'Help'" do
      expect(page).to have_content('Help')
    end

    it 'has the base title' do
      expect(page).to have_title(base_title)
    end

    it 'has a custom page title' do
      expect(page).to have_title(" | #{static_page.camelize}")
    end
  end

  describe 'About page' do
    let(:static_page) { 'about' }

    before :each do
      visit "/static_pages/#{static_page}"
    end

    it "has the content 'About Us'" do
      expect(page).to have_content('About Us')
    end

    it 'has the base title' do
      expect(page).to have_title(base_title)
    end

    it 'has a custom page title' do
      expect(page).to have_title(" | #{static_page.camelize}")
    end
  end

  describe 'Contact page' do
    let(:static_page) { 'contact' }

    before :each do
      visit "/static_pages/#{static_page}"
    end

    it "has the content 'Contact'" do
      expect(page).to have_content('Contact')
    end

    it 'has the base title' do
      expect(page).to have_title(base_title)
    end

    it 'has a custom page title' do
      expect(page).to have_title(" | #{static_page.camelize}")
    end
  end
end
