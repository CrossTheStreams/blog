class Post < ActiveRecord::Base
  include PgSearch 
  pg_search_scope :search, against: [:title, :content], using: {tsearch: {dictionary: "english"}} 

  has_many :tags
  has_many :keywords, :through => :tags

  validates_presence_of :title
  validates_presence_of :content

  attr_accessible :published, :date_published, :title, :content, :date_published, :keywords

  def as_json(options={})
    super(:only => [:id, :title, :content, :date_published, :keywords])
  end

  def self.page_count
    Post.where(:published => true).count/5
  end
   
  def self.list(page,for_json=true)
    posts = Post.paginate(:per_page => 5,
                          :page => page)
                .where(:published => true)
                .order('id DESC')
    if for_json
      posts = posts.map do |p|  
         { 
           :id => p.id,
           :date_published => p.date_published.strftime("%a %b %d %Y"),
           :title => p.title,
           :content => RedCloth.new(p.content).to_html,
           :keywords => p.keywords
         }
      end
    end
    return posts
  end

  def self.admin_list(page,for_json=true)
    posts = Post.paginate(:per_page => 20, :page => page)
                .order('id DESC')
    if for_json
      posts = posts.map do |p|  
         
            { 
           :id => p.id,
           :date_published => p.date_published ? p.date_published.strftime("%a %b %d %Y") : "Unpublished",
           :title => p.title,
           :content => p.content,
           :keywords => p.keywords,
           :published => p.published
         }
      end
    end
    return posts
  end

  def self.text_search(query)
    if query.present?
      search(query)
    else
      scoped
    end 
  end

  def self.blog_search(query)
    text_search = Post.text_search(query).select {|p| p.date_published}
    results = text_search.map do |p|
      { 
        :id => p.id, 
        :date_published => p.date_published.strftime("%a %b %d %Y"),
        :title => p.title,
        :content => RedCloth.new(p.content).to_html,
        :keywords => p.keywords
      }
    end
  end

  def self.search_by_keyword(keyword, admin=false)
    posts = Keyword.find_by_name(keyword).posts rescue []
    if !admin
      posts.select! {|p| p.published}
    end
  end

  # Since I'm a crazy person, the initial build of this app relies on client side logic for user facing content.
  # This method dispatches according to a path string given, with the returned posts being handled by the posts/noscript partial.
  # This will render content in noscript tags, which makes the app work without javascript enabled— important for SEO.
  #
  # request_path : string : the path requested in main#index
  # admin : boolean : if true, render unpublished posts
  #
  def self.noscript_dispatcher(request_path,admin=false)
    request_path = request_path.split("/")  
    if request_path.length > 1
      request_path = request_path.delete_if {|str| str.blank?}
    end
    action = request_path[0].to_s
    param1 = request_path[1].to_s
    param2 = request_path[2].to_s
    ret = []
    Rails.logger.debug("+++++ You're in the noscript_dispatcher!! action = #{action}")
    case action
      when ""
        Rails.logger.debug("Dispatched to index. param1 = #{param1} ++++++") 
        admin ? ret = Post.admin_list(1,false) : ret = Post.list(1,false)
      when "posts"
        Rails.logger.debug("Dispatched to 'posts'. param1 = #{param1} ++++++")
        ret << Post.find(param1) 
      when "page"
        Rails.logger.debug("Dispatched to 'page'. param1 = #{param1} ++++++")
        admin ? ret = Post.admin_list(param1,false) : ret = Post.list(param1,false)
      when "search"
        Rails.logger.debug("Dispatched to 'search'. param1 = #{param1} ++++++")
        ret = Post.blog_search(param1)        
      when "tag"
        Rails.logger.debug("Dispatched to 'tag'. param1 = #{param1} ++++++")
        ret = Post.search_by_keyword(param1)
    end
    ret ||= []
    return ret
  end

end
