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

  # GET /reddits
  # GET /reddits.json
  def index
    @reddits = Reddit.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @reddits }
    end
  end

  # GET /reddits/1
  # GET /reddits/1.json
  def show
    @reddit = Reddit.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @reddit }
    end
  end

  # GET /reddits/new
  # GET /reddits/new.json
  def new
    @reddit = Reddit.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @reddit }
    end
  end

  # GET /reddits/1/edit
  def edit
    @reddit = Reddit.find(params[:id])
  end

  # POST /reddits
  # POST /reddits.json
  def create
    params.has_key(:url) ? reddit_list = customsearch(:url) : reddit_list = defaultsearch
    reddit_list.count.times do |list|
      @reddit = Reddit.new
      @reddit.url = reddit_list[list]["permalink"]
      @reddit.img = reddit_list[list]["url"]
      @reddit.save
    end

    respond_to do |format|
      if @reddit.save
        format.html { redirect_to @reddit, notice: 'Reddit was successfully created.' }
        format.json { render json: @reddit, status: :created, location: @reddit }
      else
        format.html { render action: "new" }
        format.json { render json: @reddit.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /reddits/1
  # PUT /reddits/1.json
  def update
    @reddit = Reddit.find(params[:id])

    respond_to do |format|
      if @reddit.update_attributes(params[:reddit])
        format.html { redirect_to @reddit, notice: 'Reddit was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @reddit.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reddits/1
  # DELETE /reddits/1.json
  def destroy
    @reddit = Reddit.find(params[:id])
    @reddit.destroy

    respond_to do |format|
      format.html { redirect_to reddits_url }
      format.json { head :no_content }
    end
  end
end
