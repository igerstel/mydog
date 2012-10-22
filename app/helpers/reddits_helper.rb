module RedditsHelper

 #  def defaultsearch
 #  	url = "http://www.reddit.com/search.json?q=dog+reddit%3Afunny+OR+reddit%3Apics&sort=new&restrict_sr=off"
 #  	getresponse(url)
 #  end

 #  def customsearch(subreddit)
 #  	url = "http://www.reddit.com/search.json?q=dog+reddit%3A#{subreddit}&sort=new&restrict_sr=off"
 #  	getresponse(url)
 #  end

 #  def getresponse(url)
 #  	response = RestClient.get(url)
	# 	reddit = JSON.parse(response.body, :max_nesting => false) rescue nil
	# 	reddit = reddit["data"]["children"]
	# 	reddit_url = []
	# 	c = 0		
	# 	reddit.count.times do |r|
	# 		if helper.time_ago_in_words(Time.at(r["data"]["created_utc"]).to_datetime) > "12 hours"
	# 			reddit_url[c] = reddit[r]["data"]
	# 			c += 1
	# 		end
	# 	end

	# 	return reddit_url
	# end


end
