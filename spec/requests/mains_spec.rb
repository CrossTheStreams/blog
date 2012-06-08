require 'spec_helper'

describe "Main" do
  describe "GET /", :js => true do
    it "has the first post" do
      get root_path
      page.has_content?('First Post')
    end
    it "has exactly 10 posts" do
      page.has_selector?('#post', :count => 10)
    end
  end
end
