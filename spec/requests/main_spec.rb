require 'spec_helper'

describe "Main" do

  describe "GET /" do

    fixtures :posts

    before(:each) do
      visit root_path
    end 

    it "has exactly 5 posts", :js => true do
      page.should have_selector('.post', :count => 5)
      binding.pry
    end
  
  end

end

