class Note < ActiveRecord::Base
  belongs_to :user
  
  has_many :taggings, :dependent => :destroy
  has_many :tags, :through => :taggings
  
  validates_presence_of :title, :user_id
end
