class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @tags = @user.tags
    
    @notes = params[:filter_by_tag].nil? ? @user.notes : @user.notes.with_tag_name( params[:filter_by_tag] )
  end
end
