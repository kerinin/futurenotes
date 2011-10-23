class SearchController < ApplicationController
  
  def root
    @tags = Tag.limit(10)
  end
  
  def find
  end
end
