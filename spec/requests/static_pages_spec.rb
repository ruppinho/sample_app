require 'spec_helper'

describe "Static pages" do

  describe "Home page" do
    let(:static_page) { 'home' }

    before :each do
      visit "/static_pages/#{static_page}"
    end

    it "has the content 'Sample App'" do
      visit '/static_pages/home'
      expect(page).to have_content('Sample App')
    end

    it "has the right title" do
      expect(page).to have_title("Ruby on Rails Tutorial Sample App | Home")
    end
  end

  describe "Help page" do
    let(:static_page) { 'help' }

    before :each do
      visit "/static_pages/#{static_page}"
    end
    it "has the content 'Help'" do
      expect(page).to have_content('Help')
    end

    it "has the right title" do
      expect(page).to have_title("Ruby on Rails Tutorial Sample App | Help")
    end
  end

  describe "About page" do
    let(:static_page) { 'about' }

    before :each do
      visit "/static_pages/#{static_page}"
    end

    it "has the content 'About Us'" do
      expect(page).to have_content('About Us')
    end

    it "has the right title" do
      expect(page).to have_title("Ruby on Rails Tutorial Sample App | About Us")
    end
  end
end
