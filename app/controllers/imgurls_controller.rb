class ImgurlsController < ApplicationController
  # GET /imgurls
  # GET /imgurls.json
  def index
    @imgurls = Imgurl.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @imgurls }
    end
  end

  # GET /imgurls/1
  # GET /imgurls/1.json
  def show
    @imgurl = Imgurl.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @imgurl }
    end
  end

  # GET /imgurls/new
  # GET /imgurls/new.json
  def new
    @imgurl = Imgurl.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @imgurl }
    end
  end

  # GET /imgurls/1/edit
  def edit
    @imgurl = Imgurl.find(params[:id])
  end

  # POST /imgurls
  # POST /imgurls.json
  def create
    @imgurl = Imgurl.new(params[:imgurl])

    respond_to do |format|
      if @imgurl.save
        format.html { redirect_to @imgurl, notice: 'Imgurl was successfully created.' }
        format.json { render json: @imgurl, status: :created, location: @imgurl }
      else
        format.html { render action: "new" }
        format.json { render json: @imgurl.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /imgurls/1
  # PUT /imgurls/1.json
  def update
    @imgurl = Imgurl.find(params[:id])

    respond_to do |format|
      if @imgurl.update_attributes(params[:imgurl])
        format.html { redirect_to @imgurl, notice: 'Imgurl was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @imgurl.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /imgurls/1
  # DELETE /imgurls/1.json
  def destroy
    @imgurl = Imgurl.find(params[:id])
    @imgurl.destroy

    respond_to do |format|
      format.html { redirect_to imgurls_url }
      format.json { head :no_content }
    end
  end
end
