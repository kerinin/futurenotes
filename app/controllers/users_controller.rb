class UsersController < ApplicationController
  load_and_authorize_resource
  
  def show
    # @user = User.find(params[:id]) CanCan
    @tags = @user.tags
    @new_note = Note.new
    
    unless current_user.notes.empty?
      @new_note.tags = current_user.notes.last_created_first.first.tags
    end
    
    @notes = params[:filter_by_tag].nil? ? @user.notes : @user.notes.with_tag_name( params[:filter_by_tag] )
  end
end
