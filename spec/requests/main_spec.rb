require 'spec_helper'

describe "Main" do

  describe "Homepage" do

    fixtures :posts

    before(:each) do
      visit root_path
    end 

    it "has exactly 5 posts", :js => true do
      page.should have_selector('.post', :count => 5)
    end

   it "should only display public posts", :js => true do
      find('.post')
      page.should_not have_content('Unpublished post')
    end

  end

end

