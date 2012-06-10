require 'spec_helper'

describe "Main" do

  describe "GET /" do 

    it "has the first post", :js => true do
      load "#{Rails.root}/db/seeds.rb"
      binding.pry 
      visit root_path
      find(".post")
      page.should have_content('First Post')
    end

    it "has exactly 5 posts", :js => true do
      visit root_path 
      page.should have_selector?('.post')
    end
  end
end
