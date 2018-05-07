module Exceptions
  extend ActiveSupport::Concern
  class Forbidden < ActionController::ActionControllerError; end
end