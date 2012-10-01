class RedditsController < ApplicationController
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
    @reddit = Reddit.new(params[:reddit])

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
