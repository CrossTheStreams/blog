class PostsController < ApplicationController
  
  before_filter :authorize, only: [:edit, :update]

  respond_to :json
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
  
end
