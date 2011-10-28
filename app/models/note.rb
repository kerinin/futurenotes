class Note < ActiveRecord::Base
  belongs_to :user
  
  has_many :taggings, :dependent => :destroy
  has_many :tags, :through => :taggings
  
  validates_presence_of :title, :user_id
  
  acts_as_indexed :fields => [:title, :description, :indexed_tags]
  
  private
  
  def indexed_tags
    self.tags.map{|t| t.name}.join(' ')
  end
end
