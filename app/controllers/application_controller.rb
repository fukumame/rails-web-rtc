class ApplicationController < ActionController::Base
  protect_from_forgery prepend: true

  def after_sign_in_path_for(_resource)
    rooms_path
  end
end
