require 'rest_client'
require 'open-uri'
require 'json'

url = "http://www.reddit.com/r/funny/search.json?q=dog&sort=new&restrict_sr=on"

response   = RestClient.get(url)
json       = JSON.parse(response.body)["data"]["children"] rescue nil

puts json