class Note < ActiveRecord::Base
  belongs_to :user
  
  has_many :taggings, :dependent => :destroy
  has_many :tags, :through => :taggings
  
  validates_presence_of :title, :user_id
  
  acts_as_indexed :fields => [:title, :description, :indexed_tags]
  
  scope :with_tag_name, lambda{ |name| joins(:tags).where('UPPER( tags.name ) = ?', name.upcase) }
  scope :newest_first, lambda{ reorder('created_at DESC') }
  private
  
  def indexed_tags
    self.tags.map{|t| t.name}.join(' ')
  end
end
