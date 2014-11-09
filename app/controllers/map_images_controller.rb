require "map_image"

class MapImagesController < ApplicationController
  def show
    send_file MapImage.for(params[:location]), disposition: :inline
  end
end
