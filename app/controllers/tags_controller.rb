class TagsController < ApplicationController

  # Render json for tags blog-wide
  def index
    tag_counts = Keyword.all.map do |k| 
      {"keyword" => k.name, "count" => Tag.where(:keyword_id => k.id).count}
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
      hash = Tag.bubble_hash(post_array)
    end
    render :json => hash
  end

end
