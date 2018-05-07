class ApplicationController < ActionController::Base
  include Exceptions
  # protect_from_forgery prepend: true
  before_action :authenticate_user!

  def after_sign_in_path_for(_resource)
    rooms_path
  end
end
