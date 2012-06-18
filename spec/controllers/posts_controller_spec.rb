require 'spec_helper'

describe PostsController do 

  fixtures :posts

  posts = Post.all

  describe "index action" do

    it "renders the index template" do
      get :index 
    end

    it "returns the first 5 posts" do
      get :index, :format => :json
      response.body.should == Post.all[0..4].to_json
    end
  end

  describe "show action" do

    fixtures :posts

    it "renders the right post" do
      get :show, { :id => 1, :format => :json }
      response.body.should == Post.first.to_json
    end

  end
end
