class AdminController < ApplicationController
  def index
    if current_user
     @posts = Post.admin_list(1)
     @new_post = Post.new
    else
     redirect_to root_path and return
    end
  end
end
