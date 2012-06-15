class Tag < ActiveRecord::Base

  has_many :posts

  validates_uniqueness_of :keyword


end
