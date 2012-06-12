class Post < ActiveRecord::Base
  validates_presence_of :title
  validates_presence_of :content

#  attr_accessible :public, :title, :content

  def as_json(options={})
    super(:only => [:id, :title, :content, :created_at])
  end

end
