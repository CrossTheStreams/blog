require 'spec_helper'

describe 'Posts' do

  describe 'Showing Posts' do

    fixtures :posts

    it '' do
    end

    describe 'Public Posts' do
    
      it 'should show a specific public post to a guest' do
      end

      it 'should show a specific public post to an admin too...' do 
      end

    end

    describe 'Unpublished Posts' do
      
      it 'should not show a specific unpublished post to a guest' do
      end

      it 'should show a specific unpublished post to an admin user' do
      end

    end

  end

  describe 'Creating Posts' do

    it "should require admin log-in for successful post creation" do
    end

    it "should disallow post creation through mass assignment" do
    end

  end

  describe "Updating Posts" do

    it "should allow admins to update posts" do
    end

    it "should disallow updating of posts through mass assignment" do
    end

  end



end

