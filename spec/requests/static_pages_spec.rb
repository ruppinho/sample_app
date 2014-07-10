require 'spec_helper'

describe 'Static pages' do

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
