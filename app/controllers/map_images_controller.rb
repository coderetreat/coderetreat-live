require "map_image"

class MapImagesController < ApplicationController
  def show
   redirect_to MapImage.for(params[:location])
  end
end
