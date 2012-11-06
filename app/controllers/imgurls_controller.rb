class ImgurlsController < ApplicationController

  def seed
    @imgurls = Imgurl.all
    filename = 'imgurseed.txt'

    open(filename, 'w') do |f|
      @imgurls.each do |hash|
        f.puts "#{hash['url']}"
      end      
    end

    redirect_to imgurls_url
  end

  def index
    @imgurls = Imgurl.all

    respond_to do |format|
      format.html # index.html.erb
    end
  end

  def create
    @fbooks = Fbook.find_all_by_inimgur(false)
    if @fbooks.empty?
      redirect_to :back
    else
      @fbooks.each do |fb|
        @imgurl = Imgurl.new
        @imgurl.url = @imgurl.upload(@imgurl.api, fb.url)
        @imgurl.save
        fb.inimgur = true
        fb.save
      end

      respond_to do |format|
        if @imgurl.save
          format.html { redirect_to imgurls_url, notice: 'Imgurl was successfully created.' }
        else
          format.html { render action: "new" }
        end
      end
    end
  end

  def destroy
    @imgurl = Imgurl.find(params[:id])
    @imgurl.destroy

    respond_to do |format|
      format.html { redirect_to imgurls_url }
    end
  end

end