class MainController < ApplicationController
  def index
    # fetch posts in case this is a bot or user with js disabled
    @noscript_posts = Post.noscript_dispatcher(request.env["PATH_INFO"])
    if params[:query]
      redirect_to '/search/' + params[:query] and return
    end
  end

  def search 
    render :template => 'main/index'
  end

end
