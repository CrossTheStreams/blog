class TagsController < ApplicationController

  # Render json for tags blog-wide
  def index
     if !current_user 
       tag_counts = Keyword.all.map do |k|
         {"keyword" => k.name, "count" => Tag.includes(:post).where("posts.date_published is not null").where(:keyword_id => k.id).count}
       end 
    else
      tag_counts = Keyword.all.map do |k|
        {"keyword" => k.name, "count" => Tag.includes(:post).where(:keyword_id => k.id).count}
      end 
    end
    
    render :json => {
     "name" => "tags",
     "children" => tag_counts 
    }    
  end

  # Json for tags by keyword
  def keyword
    hash = {}
    if params[:name]
      keyword = Keyword.find_by_name(params[:name])
      unless keyword.nil?
        post_array = keyword.posts 
        hash = Tag.bubble_hash(post_array)
      end
    end
    render :json => hash
  end 

  #Json for tags by specific post
  def post
    hash = {}
    if params[:id]
      post_array = Post.where(:id => params[:post])
      hash = Tag.bubble_hash(post_array)
    end
    render :json => hash
  end

  # Json for tags by page of posts
  def page
    hash = {}
    if params[:page]
      post_array = Post.paginate(:per_page => 5, :page => params[:page]).where(:published => true).order('id DESC')
      hash = Tag.bubble_hash(post_array)
    end
    render :json => hash
  end

 #Json for tags within search results
  def search
    hash = {}
    if params[:query]
      post_array = Post.text_search(params[:query])
      if current_user
        hash = Tag.bubble_hash(post_array, true)
      else
        hash = Tag.bubble_hash(post_array, false)
      end
    end
    render :json => hash
  end

end
