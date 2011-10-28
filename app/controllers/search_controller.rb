class SearchController < ApplicationController
  
  def root
    @tags = Tag.limit(10)
  end
  
  def find
    @query = params[:q]
    
    @user_notes = current_user.nil? ? [] : Note.where(:user_id => current_user.id).find_with_index(@query)
    @public_notes = current_user.nil? ? Note.where( :private => false ).find_with_index(@query) : Note.where( :private => false).where("user_id != ?", current_user.id).find_with_index(@query)
  end
end
