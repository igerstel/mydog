class Imgurl < ActiveRecord::Base
  attr_accessible :url

  def api
    ENV['IMGUR_KEY']
    APP_CONFIG[:imgur_key]
  end

end
