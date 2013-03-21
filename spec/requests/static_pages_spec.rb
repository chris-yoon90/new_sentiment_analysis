require 'spec_helper'
include ApplicationHelper

describe "StaticPages" do
  subject {page}
  
  shared_examples_for "all static pages" do
    it { should have_selector('title', text: full_title(page_title)) }
    it { should have_selector('label', text: 'Keyword to search')}
    it { should have_selector('input#keyword')}
    it { should have_selector('label', text: 'Twitter')}
    it { should have_selector('input#search_type_twitter')}
    it { should have_selector('label', text: 'Reddit')}
    it { should have_selector('input#search_type_reddit')}
  end
  
  describe "Root path" do
    before {visit root_path}
    let(:page_title) {''}
    
    it_should_behave_like "all static pages"
  end
  
  describe "After twitter Search" do
    before do
      visit root_path
      fill_in "keyword", with: "Google"
      choose "search_type_twitter"
      click_button "Search"
    end
    let(:page_title) {'twitter search - Google'}
    it_should_behave_like "all static pages"
  end
  
  describe "After reddit Search" do
    before do
      visit root_path
      fill_in "keyword", with: "Google"
      choose "search_type_reddit"
      click_button "Search"
    end
    let(:page_title) {'reddit search - Google'}
    it_should_behave_like "all static pages"
  end
  
end
