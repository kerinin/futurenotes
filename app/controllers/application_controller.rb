class ApplicationController < ActionController::Base
  protect_from_forgery
  
  def after_sign_in_path_for(resource_or_scope)
    user_path(resource_or_scope)
  end
  
  rescue_from CanCan::AccessDenied do |exception|
    redirect_to :back, :alert => exception.message
  end
end
