class FbooksController < ApplicationController
require 'json' 
require 'open-uri'

  # GET /fbooks
  # GET /fbooks.json

  def seed

  end


  def index
    access = 'AAACEdEose0cBAJReULHbBywwzNQGzpKp9ZCUEBl1lvxzgebFNXCTfnz5Rf89X6o2sZA3Ij0MWqtUeEYjxlLd1UbGPlmUQZCtuppbG246wZDZD'  
    # 2011 < url = "https://graph.facebook.com/272989652716535/photos?access_token=#{access}&limit=200"
    url = "https://graph.facebook.com/373528459329320/photos?access_token=#{access}&limit=200"
      # 2012 album
    @fbooks = Fbook.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @fbooks }
    end
  end

  # GET /fbooks/1
  # GET /fbooks/1.json
  def show
    @fbook = Fbook.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @fbook }
    end
  end

  # GET /fbooks/new
  # GET /fbooks/new.json
  def new
    @fbook = Fbook.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @fbook }
    end
  end

  # GET /fbooks/1/edit
  def edit
    @fbook = Fbook.find(params[:id])
  end

  # POST /fbooks
  # POST /fbooks.json
  def create
    url = "https://graph.facebook.com/373528459329320/photos?access_token=#{access}&limit=200"

    response = open(url).read
    json_response = JSON.parse(response)
    @posts = json_response["data"]      
    newfb = @posts.select { |post| post["images"].present? }

    @fbooks = Fbook.all
    newfb.each do |nfb|
      flag = 0
      @fbooks.each do |fbs|
        if nfb["source"] == fbs.url
          flag = 1
          break
        end
      end
      if flag == 0
        @fbook = Fbook.new
        @fbook.url = nfb["source"]
        @fbook.save
      end
    end

    respond_to do |format|
      if @fbook.save
        format.html { redirect_to @fbook, notice: 'Fbook was successfully created.' }
        format.json { render json: @fbook, status: :created, location: @fbook }
      else
        format.html { render action: "new" }
        format.json { render json: @fbook.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /fbooks/1
  # PUT /fbooks/1.json
  def update
    @fbook = Fbook.find(params[:id])

    respond_to do |format|
      if @fbook.update_attributes(params[:fbook])
        format.html { redirect_to @fbook, notice: 'Fbook was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @fbook.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /fbooks/1
  # DELETE /fbooks/1.json
  def destroy
    @fbook = Fbook.find(params[:id])
    @fbook.destroy

    respond_to do |format|
      format.html { redirect_to fbooks_url }
      format.json { head :no_content }
    end
  end
end
