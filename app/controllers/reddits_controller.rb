class RedditsController < ApplicationController
  
  def defaultsearch
    url = "http://www.reddit.com/search.json?q=dog+reddit%3Afunny+OR+reddit%3Apics&sort=new&restrict_sr=off"
    getresponse(url)
  end

  def customsearch(subreddit)
    url = "http://www.reddit.com/search.json?q=dog+reddit%3A#{subreddit}&sort=new&restrict_sr=off"
    getresponse(url)
  end

  def getresponse(url)
    response = RestClient.get(url)
    reddit = JSON.parse(response.body, :max_nesting => false) rescue nil
    reddit = reddit["data"]["children"]
    reddit_url = []
    c = 0   
    reddit.count.times do |r|
      if Time.at(reddit[r]["data"]["created_utc"]).to_datetime > Time.now-100000
        reddit_url[c] = reddit[r]["data"]
        c += 1
      end
    end

    return reddit_url
  end
 
 def postcomment
    @reddit = Reddit.find_by_id(params[:id])
    @imgurls = Imgurl.all
    @reddit.commented = true
    @reddit.save
    name = @reddit.name
    doggeh = @imgurls[rand(@imgurls.count)].url.split[0]

    pword = File.open('C:\Sites\dev\reddit_api.txt').readline.to_s
    userhash = { 'user' => 'thatlookslikemydog', 'passwd' => pword, 'api_type' => 'json' }
    headers = { 'user-agent' => 'Thatlookslikemydog dog finder app' }
    url = 'https://ssl.reddit.com/api/login'    
    response = RestClient.post url, userhash, headers
    respjson = JSON.parse(response)
    modhash = respjson["json"]["data"]["modhash"]

    posturl = "http://www.reddit.com/api/comment"
    cookie = response.headers[:set_cookie]
    postheaders = { :cookie => cookie, 'user-agent' => 'Thatlookslikemydog dog finder app' }
    posting = { 'parent' => name, 'text' => "Hey, that looks like my dog! #{doggeh}", 'uh' => modhash, 'api_type' => 'json' }
    postresponse = RestClient.post posturl, posting, :cookie => cookie  #postheaders

    redirect_to reddits_url
  end

  def index
    @reddits = Reddit.all

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def new
    @reddit = Reddit.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  def create
    params.empty? ? reddit_list = customsearch(:url) : reddit_list = defaultsearch
    reddit_list.count.times do |list|
      @reddit = Reddit.new
      @reddit.url = reddit_list[list]["permalink"]
      @reddit.name = reddit_list[list]["name"]
      @reddit.img = reddit_list[list]["url"]
      ((reddit_list[list]["url"].split.last.length <= 4) && (reddit_list[list]["url"].include? 'imgur')) ? @reddit.img = reddit_list[list]["url"] : @reddit.img = reddit_list[list]["url"] + '.jpg'
      @reddit.save
    end

    oldest = Reddit.last.id-100
    if oldest > 1
      Reddit.destroy_all("id <= #{oldest}")
    end

    respond_to do |format|
      if @reddit.save
        format.html { redirect_to reddits_url, notice: 'Reddit was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end

end
