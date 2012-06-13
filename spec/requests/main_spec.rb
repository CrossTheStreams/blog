require 'spec_helper'

describe "Main" do

  describe "GET /" do

   before(:each) do
     posts = FactoryGirl.create_list(:post, 25)
     check_for_errors = true
     visit root_path
   end 

    it "has exactly 5 posts", :js => true do
      page.should have_selector('.post', :count => 5)
    end
  
  end

end

