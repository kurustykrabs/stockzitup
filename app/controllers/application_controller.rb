class ApplicationController < ActionController::Base

  def after_sign_in_path_for(resource_or_scope)
  home_index_path
  end

  protect_from_forgery with: :exception

  before_action :authenticate_user!

end
