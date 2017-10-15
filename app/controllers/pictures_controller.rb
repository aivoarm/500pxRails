class PicturesController < ApplicationController

private def getApi(feature = "popular", page = 1  )
    @@api =   Picture.get("https://api.500px.com/v1/photos/?feature=#{feature}&page=#{page}&image_size=1080")
end


def api

    feature = params[:feature]
    page = params[:current_page]
    image_size = 1080#params[:image_size]

    @pics = getApi(feature, page) #Picture.get("https://api.500px.com/v1/photos/?feature=#{@feature}&page=#{@page}&image_size=#{@image_size}")#['photos']
    #@pics =  Picture.get("https://api.500px.com/v1/photos/?feature=#{feature}&page=#{page}&image_size=1000")#['photos']

    render json: @pics

 end


  def categories
    
  page = params[:current_page]
  feature = params[:feature]
    # @image_size=1080#params[:image_size]
    # @url = 'https://500px.com'
    #@pics =  api[@pics]#Picture.get("https://api.500px.com/v1/photos/?feature=#{@feature}&page=#{@page}&image_size=#{@image_size}")['photos']
    @pics = getApi(feature, page)['photos']


    @category=[]
      @pics.each do |chr|
        @category.push(chr['category'].to_s)
      end

    @categories_list={}
      File.open("public/500cat.txt", "r") do |f|
        f.each_line do |line|
          @categories_list[line.chomp.split[0]]=line.chomp.split[1]
        end
      end

      @categories={}
      @category.each do |e|
        @categories[e] =@categories_list[e]
      end


      render json: @categories

  end
end
