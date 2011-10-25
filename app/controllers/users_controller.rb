class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @tags = Tag.joins(:notes).where('notes.user_id == ?', @user.id)
  end
end
