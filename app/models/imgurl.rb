class Imgurl < ActiveRecord::Base
  attr_accessible :url

	# require 'open-uri'

  def api
    File.open('C:\Sites\dev\imgur_api.txt').readline.to_s
  end

	def upload(key, file_path)
	  url        = "http://imgur.com/api/upload.json"
	  data       = {
	    :key     => key, :image => open(file_path)
	  }

	  response   = RestClient.post(url, data)
	  imgur_url  = JSON.parse(response.body)["rsp"]["image"]["original_image"] rescue nil
	end

end
