class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @tags = Tag.joins(:notes).where('notes.user_id == ?', @user.id)
    
    @notes = params[:filter_by_tag].nil? ? @user.notes : @user.notes.with_tag_name( params[:filter_by_tag] )
  end
end
