class AdminController < ApplicationController
  def index
   @posts = Post.admin_list(1)
  end
end
