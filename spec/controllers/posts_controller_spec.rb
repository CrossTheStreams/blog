require 'spec_helper'

describe PostsController do

  describe "index action" do
    it "renders the index template" do
      get :index
    end
  end

  describe "show action" do
    before(:each) do
      @post = FactoryGirl.build_stubbed(:post)
      Post.stub!(:find, @post.id).and_return(@post)
    end

    it "renders the right post" do
      get :show, :id => 1001
      response.body.should == @post.to_json
    end
  end
end
