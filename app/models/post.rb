class Post < ActiveRecord::Base
  include TagsHelper 
  attr_accessor :post_date

  after_initialize do 
    @post_date = Time.new.strftime("%a %b %d %Y")
  end

  has_and_belongs_to_many :tags

  validates_presence_of :title
  validates_presence_of :content

  attr_accessible :public, :title, :content, :post_date, :tags, :tag_ids

  def as_json(options={})
    super(:only => [:id, :title, :content, :post_date])
  end

  def self.page_count
    Post.where(:public => true).count/5
  end
   
  def self.list(page)
    Post.paginate(:per_page => 5, :page => page).where(:public => true).order('id DESC').map do |p|  
       { 
         :id => p.id,
         :post_date => p.post_date,
         :title => p.title,
         :content => p.content,
         :tags => p.tags 
       }
    end
  end

  def self.admin_list(page)
    Post.paginate(:per_page => 20, :page => page).order('id DESC').map do |p|  
       { 
         :id => p.id,
         :post_date => p.post_date,
         :title => p.title,
         :content => p.content,
         :tags => p.tags,
         :public => p.public
       }
    end
  end

end
