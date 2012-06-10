require 'spec_helper'

describe PostsController do 

  describe "index action" do
    it "renders the index template" do
      get :index
    end
  end

  describe "show action" do

    let(:post) { FactoryGirl.create(:post) } 
    it "renders the right post" do
      Post.stub(:find, post.id).and_return(post)
      Post.should_receive(:find)
      get :show, { :id => 1001, :format => :json }
      response.body.should == post.to_json
    end

  end
end
