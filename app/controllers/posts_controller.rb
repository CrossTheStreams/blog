class PostsController < ApplicationController
  
  before_filter :authorize, only: [:update]

  respond_to :json, :html
  module Options
  end

  def index
    respond_with Post.list(params[:page])
  end

  def show
    respond_with Post.find(params[:id])
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
    respond_with Post.text_search(params[:search]) 
  end

end
