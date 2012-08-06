class ApplicationController < ActionController::Base
  protect_from_forgery

  helper_method :access
  def access
  	''
  end

end
