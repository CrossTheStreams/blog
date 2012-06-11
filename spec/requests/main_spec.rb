require 'spec_helper'

describe "Main" do

  describe "GET /" do

   before(:each) do
     first_post = FactoryGirl.create(:firstpost)
     other_posts = FactoryGirl.create_list(:post, 25)
     visit root_path
   end 

    it "has the first post", :js => true do
      page.should have_content('First Post')
    end

    it "has exactly 5 posts", :js => true do
      visit root_path 
      page.should have_selector?('.post')
    end
  end
end
