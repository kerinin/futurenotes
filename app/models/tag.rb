class Tag < ActiveRecord::Base
  has_many :taggings, :dependent => :destroy
  has_many :notes, :through => :taggings
  
  extend FriendlyId
  friendly_id :name, :use => :slugged
end
