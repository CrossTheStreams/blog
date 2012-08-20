class PostsController < ApplicationController
  
  before_filter :authorize, only: [:update]
  respond_to :json

  module Options
  end

  def index
    respond_with Post.list(params[:page])
  end

  def show
    post = Post.find(params[:id])
    render :json => {:id => post.id, :title => post.title, :date_published => post.date_published.strftime("%a %b %d %Y"), :content => post.content, :keywords => post.keywords.map {|k| k.name}}.to_json 
  end

  def create
    respond_with Post.create(params[:post])
  end

  def update
    respond_with Post.update(params[:id], params[:post])
  end

  def destroy
    respond_with Post.destroy(params[:id])
  end

  def edit
    respond_with @post = Post.find(params[:id])
  end

  def new
    respond_with @post = Post.new 
  end

  def search
    render :json => Post.blog_search(params[:query]).to_json
  end

end
