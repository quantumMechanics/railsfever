class ApplicationController < ActionController::Base
  protect_from_forgery
  include SessionsHelper
  include UsersHelper
  include BlogsHelper
  require 'custom_pagination_renderer'
end
