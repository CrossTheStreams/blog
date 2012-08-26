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
    if params[:post]
      @post = Post.create(:title => params[:post][:title],
                          :content => RedCloth.new(params[:post][:content]),
                          :published => params[:post]["published"] == "1",
                          :date_published => ((params[:post]["published"] == "1") ? DateTime.now : nil))
      if params[:keywords]
        names = params[:keywords].split(",").map {|n| n.lstrip!;n.rstrip!;n.capitalize!}
        names.map do |name|
          keyword = Keyword.find_or_create_by_name(:name => name)
          tag = Tag.find_or_create_by_post_id_and_keyword_id(:post_id => @post.id,
                                                             :keyword_id => keyword.id)
        end
      end
    end
    if @post && @post.save
      redirect_to admin_path
    end
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
