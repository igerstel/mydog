class FbooksController < ApplicationController
  require 'open-uri'

  def seed
    @fbooks = Fbook.all
    filename = 'fbseed.txt'

    open(filename, 'w') do |f|
      @fbooks.each do |hash|
        f.puts "#{hash['url']} #{hash['inimgur']}"
      end      
    end

    redirect_to fbooks_url
  end

  def index
    @fbooks = Fbook.all

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def new
    @fbook = Fbook.new

    respond_to do |format|
      format.html # new.html.erb
    end
  end

  def create
    # 2011 album url = "https://graph.facebook.com/272989652716535/photos?access_token=#{access}&limit=200"
    # 2012 album
    @fbook = Fbook.new(params[:fbook])
    access = @fbook.access
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
      if @fbook.present? && @fbook.save
        format.html { redirect_to fbooks_url, notice: 'Fbook was successfully created.' }
      else
        format.html { render action: "new" }
      end
    end
  end

  def destroy
    @fbook = Fbook.find(params[:id])
    @fbook.destroy

    respond_to do |format|
      format.html { redirect_to fbooks_url }
    end
  end

end