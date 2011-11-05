class Tag < ActiveRecord::Base
  has_many :taggings, :dependent => :destroy
  has_many :notes, :through => :taggings
  
  default_scope :order => :name
end
