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
   
  def self.list(page)
    Post.paginate(:per_page => 5, :page => page).where(:published => true).order('id DESC').map do |p|  
       { 
         :id => p.id,
         :date_published => p.date_published.strftime("%a %b %d %Y"),
         :title => p.title,
         :content => RedCloth.new(p.content).to_html,
         :keywords => p.keywords
       }
    end
  end

  def self.admin_list(page)
    Post.paginate(:per_page => 20, :page => page).order('id DESC').map do |p|  
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

end
