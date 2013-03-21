require 'spec_helper'
include ApplicationHelper

describe "StaticPages" do
  subject {page}
  
  describe "Root path" do
    before {visit root_path}
    let(:page_title) {''}
    
    it { should have_selector("title", text: full_title(page_title))}
   
  end
end
