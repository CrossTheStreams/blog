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

  def self.page_count(admin=false)
    if admin
      (Post.count.to_f/5.to_f).ceil
    else
      (Post.where(:published => true).count.to_f/CFG["posts_per_page"].to_f).ceil
    end
  end

  # Fetch id of next post and return as string
  # id : integer : id of post we need to fetch past
  # admin : boolean : current_user.admin?, should we display unpublished stuff?
  def next_link(admin=false)
    if admin
      Post.limit(1).where("id > #{self.id}").pluck(:id).to_s
    else
      Post.limit(1).where("id > #{self.id} and date_published is not null").pluck(:id).first.to_s
    end
  end

  # Fetch id of next post and return as string
  # id : integer : id of post we need to fetch past
  # admin : boolean : current_user.admin?, should we display unpublished stuff?
  def prev_link(admin=false)
    if admin
      Post.limit(1).where("id < #{self.id}").order("id DESC").pluck(:id).to_s
    else
      Post.limit(1).where("id < #{self.id} and date_published is not null").order("id DESC").pluck(:id).first.to_s 
    end
  end
   
  def self.list(page,for_json=true)
    posts = Post.paginate(:per_page => CFG["posts_per_page"], :page => page).where(:published => true).order('id DESC')
    if for_json
      posts = posts.map do |p|  
         { 
           :id => p.id,
           :date_published => p.date_published.strftime("%a %b %d %Y"),
           :title => p.title,
           :content => BlueCloth.new(p.content).to_html,
           :keywords => p.keywords
         }
      end
    end
    return posts
  end

  def self.admin_list(page,for_json=true)
    posts = Post.paginate(:per_page => CFG["posts_per_page"], :page => page).order('id DESC')
    if for_json
      posts = posts.map do |p|  
         
         { 
           :id => p.id,
           :date_published => p.date_published ? p.date_published.strftime("%a %b %d %Y") : "Unpublished",
           :title => p.title,
           :content => BlueCloth.new(p.content).to_html,
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
        :content => BlueCloth.new(p.content).to_html,
        :keywords => p.keywords
      }
    end
  end

  def self.search_by_keyword(keyword, admin=false)
    posts = Keyword.find_by_name(keyword).posts.order('id DESC') rescue []
    if !admin
      posts.reject! {|p| !p.date_published}
    end
    posts
  end



end
