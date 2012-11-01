class Reddit < ActiveRecord::Base
  attr_accessible :url

 def api
    File.open('C:\Sites\dev\reddit_api.txt').readline.to_s
  end


end
