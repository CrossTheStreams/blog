class Post < ActiveRecord::Base
  attr_accessor :post_date

  after_initialize do 
    @post_date = Time.new.strftime("%a %b %d %Y")
  end

  has_many :tags

  validates_presence_of :title
  validates_presence_of :content

  attr_accessible :public, :title, :content, :post_date

  def as_json(options={})
    super(:only => [:id, :title, :content, :post_date])
  end
   
  def self.list(page)
    Post.where(:public => true).paginate(:per_page => 5, :page => page).map do |p|  
       { 
         :id => p.id,
         :post_date => p.post_date,
         :title => p.title,
         :content => p.content 
       }
    end
  end

end
