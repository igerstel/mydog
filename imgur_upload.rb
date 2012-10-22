# require 'rubygems'
require 'rest_client'
require 'open-uri'
require 'json'

def imgur(key, file_path)
  url        = "http://imgur.com/api/upload.json"
  data       = {
    :key     => key, :image => open(file_path)
  }

  response   = RestClient.post(url, data)
  json       = JSON.parse(response.body)["rsp"]["image"] rescue nil

puts response
puts "----------------"
puts json

end

key = File.open('imgur_api.txt').readline.to_s

pic_url = "https://sphotos-a.xx.fbcdn.net/hphotos-prn1/562932_515451068470391_1542759738_n.jpg"

imgur(key, pic_url)


