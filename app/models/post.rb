class Post < ActiveRecord::Base


  after_initialize do 
    post_date = Time.new.strftime("%a %b %d %Y")
  end

  has_many :tags

  validates_presence_of :title
  validates_presence_of :content

 attr_accessible :public, :title, :content, :post_date

 def as_json(options={})
   super(:only => [:id, :title, :content, :post_date])
 end

end
