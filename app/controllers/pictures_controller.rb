class PicturesController < ApplicationController
  def index

  @page = 2
  @feature = 'popular'
  @image_size=1080
  @url = 'https://500px.com'
  @pics =   Picture.get("https://api.500px.com/v1/photos/?feature=#{@feature}&page=#{@page}&image_size=#{@image_size}")['photos']


  end
end
