class AdminController < ApplicationController
  def index
    if current_user
     @posts = Post.admin_list(1)
     @new_post = Post.new
    else
     redirect_to root_path and return
    end
  end

  def keyword
    keyword = Keyword.find_or_create_by_name(params[:name]) rescue nil
    if keyword
      render :json => {:id => keyword.id} 
    end
  end

end
