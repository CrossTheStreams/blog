class PostsController < ApplicationController
  
  before_filter :authorize, :only => [:create,:update,:destroy]
  respond_to :json

  module Options
  end

  def index
    if current_user
      respond_with Post.admin_list(params[:page]).to_json 
    else
      respond_with Post.list(params[:page]).to_json
    end
  end

  def show
    post = Post.find(params[:id])
    current_user ||= nil
    current_user ? admin = true : admin = false
    render :json => {:id => post.id, 
                     :title => post.title, 
                     :date_published => (post.date_published.strftime("%a %b %d %Y") rescue ''), 
                     :content => BlueCloth.new(post.content).to_html, 
                     :keywords => post.keywords.map {|k| k.name},
                     :next => post.next_link(admin),
                     :previous => post.prev_link(admin)}
  end

  def create
    if params[:post]
      post = Post.create(:title => params[:post][:title],
                          :content => BlueCloth.new(params[:post][:content]).text,
                          :published => params[:post]["published"] == "1",
                          :date_published => ((params[:post]["published"] == "1") ? DateTime.now : nil))
      params[:post][:keywords] = [] if params[:post][:keywords].nil?
      post.tags.delete_all
      keyword_ids = params[:post][:keywords].map(&:to_i)
      keywords = Keyword.where(:id => keyword_ids)
      keywords.map do |keyword| 
        tag = Tag.find_or_create_by_post_id_and_keyword_id(:post_id => post.id, :keyword_id => keyword.id)
      end
    end
    render :text => "Post successfully created" and return
  end

  def update
    post = Post.find_by_id(params[:id])
    if post
      post.update_attributes(:title => params[:post][:title],
                                     :content => BlueCloth.new(params[:post][:content]).text,
                                     :published => params[:post]["published"] == "true",
                                     :date_published => ((params[:post]["published"] == "true") ? DateTime.now : nil))

      params[:post][:keywords] = [] if params[:post][:keywords].blank?
      post.tags.delete_all
      keyword_ids = params[:post][:keywords].map(&:to_i)
      keywords = Keyword.where(:id => keyword_ids)
      keywords.map do |keyword| 
        tag = Tag.find_or_create_by_post_id_and_keyword_id(:post_id => post.id, :keyword_id => keyword.id)
      end
      render :text => "Post successfully updated."
    else 
      render :text => "Post with id #{params[:id]} does not exist."
    end
  end

  def destroy
    post = Post.find_by_id(params[:id]).destroy
    render :json => {:id => post.id, 
                     :title => post.title, 
                     :date_published => (post.date_published.strftime("%a %b %d %Y") rescue ''), 
                     :content => post.content.html_safe, 
                     :keywords => post.keywords.map {|k| k.name}}
  end

  def edit

    post = Post.find(params[:id])
    render :json => {:id => post.id, 
                     :title => post.title, 
                     :published => post.published,
                     :date_published => (post.date_published.strftime("%a %b %d %Y") rescue ''), 
                     :content => post.content, 
                     :keywords => post.keywords.map {|k| {:name => k.name, :id => k.id}}}
  end

  def new
    respond_with @post = Post.new
  end

  def search
    render :json => Post.blog_search(params[:query])
  end

  def tag
    posts = []
    if !current_user
      posts = Post.search_by_keyword(params[:keyword])
    else
      posts = Post.search_by_keyword(params[:keyword], true)
    end
    json_hash = posts.map {|p| 
      { 
        :id => p.id, 
        :date_published => (post.date_published.strftime("%a %b %d %Y") rescue 'Unpublished'), 
        :title => p.title,
        :content => BlueCloth.new(p.content).to_html,
        :keywords => p.keywords
      } 
    }
    render :json => json_hash
  end


end
