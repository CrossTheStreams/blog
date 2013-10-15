class MainController < ApplicationController
  include NoScript
  def index
    # fetch posts in case this is a bot or user with js disabled
    @noscript_posts = NoScript.dispatcher(request.env["PATH_INFO"])
    if params[:query]
      redirect_to '/search/' + params[:query].gsub(' ','%20') and return
    end
  end

  def search 
    render :template => 'main/index'
  end

  def resume
    render template: 'main/resume', layout: false
  end

end
