class Keyword < ActiveRecord::Base
  has_many :tags
  has_many :posts, :through => :tags
  validates_uniqueness_of :name, :case_sensitive => false 
end
