class Note < ActiveRecord::Base
  has_many :taggings, :dependent => :destroy
  has_many :tags, :through => :taggings
  
  validates_presence_of :title
end
