class PostsController < ApplicationController
  
  before_filter :authorize, :only => [:create,:update]
  respond_to :json

  module Options
  end

  def index
    respond_with Post.list(params[:page]).to_json
  end

  def show
    post = Post.find(params[:id])
    render :json => {:id => post.id, 
                     :title => post.title, 
                     :date_published => post.date_published.strftime("%a %b %d %Y"), 
                     :content => RedCloth.new(post.content).to_html, 
                     :keywords => post.keywords.map {|k| k.name}}.to_json 
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

  def destroy
    post = Post.find_by_id(params[:id]).destroy
    render :json => {:id => post.id, 
                     :title => post.title, 
                     :date_published => post.date_published.strftime("%a %b %d %Y"), 
                     :content => RedCloth.new(post.content).to_html, 
                     :keywords => post.keywords.map {|k| k.name}}.to_json 
  end

  def edit
    post = Post.find(params[:id])
    render :json => {:id => post.id, 
                     :title => post.title, 
                     :published => post.published,
                     :date_published => post.date_published.strftime("%a %b %d %Y"), 
                     :content => post.content, 
                     :keywords => post.keywords.map {|k| k.name}}.to_json 
  end

  def new
    respond_with @post = Post.new
  end

  def search
    render :json => Post.blog_search(params[:query]).to_json
  end

  def tag 
  end

end
